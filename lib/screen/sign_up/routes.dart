import 'dart:math';

import 'package:anti_fake_book/provider.dart';
import 'package:anti_fake_book/services/api.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:anti_fake_book/widgets/buttons.dart';
import 'package:anti_fake_book/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

// SignUp
//  SignUpName
//  SignUpBirthday
//  SignUpEmail
//  PasswordSignUp
//  AcceptSignUp
const prefix = "/sign-up";
final Map<String, String> nextPage = {
  "begin": "name",
  "name": "age",
  "age": "email",
  "email": "password",
  "password": "verify",
  "policy": "verify",
  "verify": "save-info",
}.map((key, value) => MapEntry(key, "$prefix/$value"));

class BeginSignUp extends StatefulWidget {
  final PageController pageController;
  const BeginSignUp({super.key, required this.pageController});

  @override
  State<BeginSignUp> createState() => _BeginSignUpState();
}

class _BeginSignUpState extends State<BeginSignUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tham gia Anti-Fakebook", style: CustomTextStyle.titleStyle),
        const SizedBox(
          height: 20,
        ),
        const Image(image: AssetImage("assets/images/community.avif")),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Tạo tài khoản để kết nối với bạn bè, người thân và cộng đồng có chung sở thích",
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(
          height: 10,
        ),
        PrimaryButton(
          text: "Bắt đầu",
          onPressed: () => widget.pageController.nextPage(
              duration: const Duration(milliseconds: 500), curve: Curves.ease),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40.0,
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: CustomButtonStyle.roundBorderButton(30.0),
            child: const Text("Tôi có tài khoản rồi"),
          ),
        ),
      ],
    );
  }

  Widget buildHeading() {
    return Container(
        alignment: Alignment.centerLeft,
        child: const Text(
          "Tham gia Anti-Fakebook",
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ));
  }
}

class SignUpName extends StatefulWidget {
  final PageController pageController;
  const SignUpName({super.key, required this.pageController});

  @override
  State<SignUpName> createState() => _SignUpNameState();
}

class _SignUpNameState extends State<SignUpName> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bạn tên gì?", style: CustomTextStyle.titleStyle),
          const SizedBox(
            height: 10,
          ),
          Text("Nhập tên bạn sử dụng trong đời thực",
              style: CustomTextStyle.normalStyle),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Họ',
                  ),
                  controller: lastNameController,
                  validator: validateName,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tên',
                  ),
                  controller: firstNameController,
                  validator: validateName,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 40.0,
              width: double.infinity,
              child: ElevatedButton(
                  style: CustomButtonStyle.roundBorderButton(30.0),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }
                  },
                  child: const Text("Tiếp tục"))),
        ],
      ),
    );
  }

  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Họ và tên không được để trống';
    } else {
      return null;
    }
  }
}

class SignUpAge extends StatefulWidget {
  const SignUpAge({super.key, required this.pageController});
  final PageController pageController;
  static const message =
      "Chọn ngày sinh của bạn. Bạn luôn có thể đặt thông tin này ở chế độ riêng tư vào lúc khác.";
  static const message2 = "Tại sao tôi cần cung cấp ngày sinh của mình?";

  @override
  State<SignUpAge> createState() => _SignUpAgeState();
}

class _SignUpAgeState extends State<SignUpAge> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ngày sinh của bạn là khi nào?",
            style: CustomTextStyle.titleStyle),
        const SizedBox(
          height: 10,
        ),
        Text(SignUpAge.message, style: CustomTextStyle.normalStyle),
        Text(SignUpAge.message2, style: CustomTextStyle.normalStyle),
        const SizedBox(
          height: 10,
        ),
        buildDatePicker(context),
        const SizedBox(
          height: 10,
        ),
        ContinueButton(
          onPressed: () {
            int age = _computeAge(selectedDate);
            if (age < 13) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Bạn chưa đủ tuổi"),
                      content: const Text(
                          "Bạn phải đủ 13 tuổi để sử dụng Anti-Fakebook"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Đóng"),
                        )
                      ],
                    );
                  });
              return;
            } else {
              widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            }
          },
        )
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      locale: const Locale("vi", "VN"),
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  int _computeAge(DateTime dob) {
    DateTime now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return max(age, 0);
  }

  String _getAgeString(DateTime dob) {
    int age = _computeAge(dob);
    String text = DateFormat.yMMMMd('vi_VI').format(dob);
    return "$text - $age tuổi";
  }

  Widget buildDatePicker(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => _selectDate(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.grey),
          ),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ngày sinh",
                  style: CustomTextStyle.normalStyle,
                ),
                Text(
                  _getAgeString(selectedDate),
                  style: CustomTextStyle.normalStyle.merge(const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpEmail extends StatefulWidget {
  final PageController pageController;
  const SignUpEmail({super.key, required this.pageController});
  static const message =
      "Nhập email có thể dùng để liên hệ với bạn. Thông tin này sẽ không hiển thị với ai khác trên trang cá nhân của bạn.";
  static const message2 =
      "Bạn cũng sẽ nhận được email của chúng tôi và có thể chọn không nhận bất cứ lúc nào. ";

  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  late String email;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email", style: CustomTextStyle.titleStyle),
          const SizedBox(
            height: 10,
          ),
          Text(
            SignUpEmail.message,
            textAlign: TextAlign.justify,
            style: CustomTextStyle.normalStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return TextFormField(
                initialValue: ref.read(signUpStateProvider).email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                validator: validateEmail,
                onSaved: (value) => email = value ?? "",
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
              text: const TextSpan(children: [
            TextSpan(
                text: SignUpEmail.message2,
                style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: "Tìm hiểu thêm", style: TextStyle(color: Colors.blue))
          ])),
          const SizedBox(
            height: 10,
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ContinueButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    _formKey.currentState?.save();
                    ref.read(signUpStateProvider).email = email;
                    widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class SignUpPassword extends StatefulWidget {
  final PageController pageController;
  const SignUpPassword({super.key, required this.pageController});
  static const message =
      "Tạo mật khẩu gồm ít nhất 6 chữ cái hoặc chữ số. Bạn nên chọn mật khẩu thật khó đoán.";

  @override
  State<SignUpPassword> createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends State<SignUpPassword> {
  final _formKey = GlobalKey<FormState>();
  late String? password1;
  late String? password2;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tạo mật khẩu", style: CustomTextStyle.titleStyle),
          const SizedBox(
            height: 10,
          ),
          Text(
            SignUpPassword.message,
            style: CustomTextStyle.normalStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              password1 = ref.read(signUpStateProvider).password;
              return PasswordField(
                initialValue: ref.read(signUpStateProvider).password,
                labelText: "Mật khẩu",
                validator: (value) {
                  String email = ref.read(signUpStateProvider).email;
                  return validatePassword(value, email);
                },
                onChanged: (value) => password1 = value,
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
            password2 = ref.read(signUpStateProvider).password;
            return PasswordField(
                initialValue: ref.read(signUpStateProvider).password,
                labelText: "Nhập lại mật khẩu",
                validator: (value) {
                  if (value != password1) {
                    return "Mật khẩu không khớp";
                  }
                  return null;
                },
                onChanged: (value) => password2 = value);
          }),
          const SizedBox(
            height: 10,
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ContinueButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    ref.read(signUpStateProvider).password = password1 ?? "";
                    widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class SaveInfo extends StatelessWidget {
  const SaveInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              "Lưu thông tin đăng nhập của bạn",
              style: CustomTextStyle.titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Lần tới khi đăng nhập vào điện thoại này, bạn chỉ cấn nhấn vào ảnh đại diện thay vì nhập mật khẩu. Bạn có thể tắt tính năng này bất cứ lúc nào trong phần cài đặt",
              style: CustomTextStyle.normalStyle,
            ),
            const Spacer(),
            const NavPrimaryButton(nextPage: "/", text: "Tiếp tục"),
            const SizedBox(
              height: 10,
            ),
            const NavSecondaryButton(nextPage: "/", text: "Để sau"),
          ],
        ),
      ),
    );
  }
}

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Xác nhận tài khoản", style: CustomTextStyle.titleStyle),
        const SizedBox(
          height: 10,
        ),
        Text(
            "Chúng tôi đã gửi mã xác nhận tới email của bạn. Vui lòng kiểm tra email và nhập mã gồm 6 chữ số vào đây.",
            style: CustomTextStyle.normalStyle),
        const SizedBox(
          height: 10,
        ),
        buildCodeField(),
        const SizedBox(
          height: 10,
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            String email = ref.read(signUpStateProvider).email;
            return PrimaryButton(
              onPressed: () => _onPressed(context, email),
              text: "Xác nhận",
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40.0,
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: CustomButtonStyle.roundBorderButton(30.0),
            child: const Text("Gửi lại mã"),
          ),
        )
      ],
    );
  }

  void _onPressed(BuildContext context, String email) async {
    String code = _controller.text;
    var responseCode = await checkVerifyCode(email, code);
    if (!isSuccessCode(responseCode)) {
      // ignore: use_build_context_synchronously
      await showErrorDialog(context, responseCode);
      return;
    }
    // ignore: use_build_context_synchronously
    context.go("/");
  }

  Widget buildCodeField() {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 120.0,
        child: TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          maxLength: 6, // Adjust to the desired code length

          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '', // To hide the character count
          ),
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PolicyScreen extends StatefulWidget {
  final PageController pageController;
  const PolicyScreen({super.key, required this.pageController});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  final bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..addJavaScriptChannel("app",
                  onMessageReceived: (JavaScriptMessage message) async {
                String email = ref.read(signUpStateProvider).email;
                String password = ref.read(signUpStateProvider).password;
                String deviceId = await getDeviceId(context);
                var responseCode = await signUp(email, password, deviceId);
                if (!isSuccessCode(responseCode)) {
                  // ignore: use_build_context_synchronously
                  await showErrorDialog(context, responseCode);
                  return;
                }
                responseCode = await getVerifyCode(email);
                if (!isSuccessCode(responseCode)) {
                  // ignore: use_build_context_synchronously
                  await showErrorDialog(context, responseCode);
                  return;
                }
              })
              ..loadFlutterAsset('assets/policy.html'));
      },
    );
  }
}
