import 'package:anti_fake_book/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../styles.dart';

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

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(
        child: Column(
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
        NavPrimaryButton(nextPage: nextPage['begin'], text: "Bắt đầu"),
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
    ));
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

class Template extends StatelessWidget {
  final Widget child;
  final bool hasBackButton;
  const Template({required this.child, super.key, this.hasBackButton = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.black,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: child,
          )),
    );
  }
}

class SignUpName extends StatelessWidget {
  const SignUpName({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(
        children: [
          LeftAlign(
              child: Text("Bạn tên gì?", style: CustomTextStyle.titleStyle)),
          const SizedBox(
            height: 10,
          ),
          LeftAlign(
            child: Text("Nhập tên bạn sử dụng trong đời thực",
                style: CustomTextStyle.normalStyle),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Họ',
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tên',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          NavPrimaryButton(nextPage: nextPage['name'], text: "Tiếp tục"),
        ],
      ),
    );
  }
}

class SignUpAge extends StatefulWidget {
  const SignUpAge({super.key});
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
    return Template(
      child: Column(
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
          NavPrimaryButton(nextPage: nextPage['age'], text: "Tiếp tục"),
        ],
      ),
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
                  DateFormat.yMMMMd('vi_VI').format(selectedDate),
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

class SignUpEmail extends StatelessWidget {
  const SignUpEmail({super.key});
  static const message =
      "Nhập email có thể dùng để liên hệ với bạn. Thông tin này sẽ không hiển thị với ai khác trên trang cá nhân của bạn.";
  static const message2 =
      "Bạn cũng sẽ nhận được email của chúng tôi và có thể chọn không nhận bất cứ lúc nào. ";
  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email", style: CustomTextStyle.titleStyle),
          const SizedBox(
            height: 10,
          ),
          Text(
            message,
            textAlign: TextAlign.justify,
            style: CustomTextStyle.normalStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
              text: const TextSpan(children: [
            TextSpan(text: message2, style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: "Tìm hiểu thêm", style: TextStyle(color: Colors.blue))
          ])),
          const SizedBox(
            height: 10,
          ),
          NavPrimaryButton(nextPage: nextPage['email'], text: "Tiếp tục"),
        ],
      ),
    );
  }
}

class SignUpPassword extends StatelessWidget {
  const SignUpPassword({super.key});
  static const message =
      "Tạo mật khẩu gồm ít nhất 6 chữ cái hoặc chữ số. Bạn nên chọn mật khẩu thật khó đoán.";
  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tạo mật khẩu", style: CustomTextStyle.titleStyle),
          const SizedBox(
            height: 10,
          ),
          Text(
            message,
            style: CustomTextStyle.normalStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mật khẩu',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nhập lại mật khẩu',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          NavPrimaryButton(nextPage: nextPage['password'], text: "Tiếp tục"),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget ContinueButton(
    {required BuildContext context, Widget? nextPage, String text = "Tiếp"}) {
  return SizedBox(
    height: 40.0,
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        if (nextPage != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextPage));
        }
      },
      style: CustomButtonStyle.roundBorderButton(30.0),
      child: Text(text),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget SecondaryButton(
    {required BuildContext context, Widget? nextPage, required String text}) {
  return SizedBox(
    height: 40.0,
    width: double.infinity,
    child: OutlinedButton(
      onPressed: () {
        if (nextPage != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextPage));
        }
      },
      style: CustomButtonStyle.roundBorderButton(30.0),
      child: Text(text),
    ),
  );
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

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const NavPrimaryButton(nextPage: '/', text: "Xác nhận"),
        const SizedBox(
          height: 10,
        ),
        const NavSecondaryButton(nextPage: '/', text: "Gửi lại mã"),
      ],
    ));
  }

  Widget buildCodeField() {
    return SizedBox(
      width: 120.0,
      child: TextField(
        // controller: _controller,
        keyboardType: TextInputType.number,
        maxLength: 6, // Adjust to the desired code length

        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '', // To hide the character count
        ),
        onChanged: (value) {
          // Handle verification code input here
          if (value.length == 6) {
            // // The code is complete; you can perform verification here
            // print('Verification Code: $value');
          }
        },
        maxLines: 1,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Verification Code Input'),
//         ),
//         body: Center(
//           child: VerificationCodeInput(),
//         ),
//       ),
//     );
//   }
// }

// class VerificationCodeInput extends StatefulWidget {
//   @override
//   _VerificationCodeInputState createState() => _VerificationCodeInputState();
// }

// class _VerificationCodeInputState extends State<VerificationCodeInput> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: TextField(
//         controller: _controller,
//         keyboardType: TextInputType.number,
//         maxLength: 6, // Adjust to the desired code length
//         decoration: InputDecoration(
//           hintText: 'Enter Verification Code',
//           counterText: '', // To hide the character count
//         ),
//         onChanged: (value) {
//           // Handle verification code input here
//           if (value.length == 6) {
//             // The code is complete; you can perform verification here
//             print('Verification Code: $value');
//           }
//         },
//       ),
//     );
//   }
// }
