import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../styles.dart';

// SignUp
//  SignUpName
//  SignUpBirthday
//  SignUpEmail
//  PasswordSignUp
//  AcceptSignUp
class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              buildHeading(),
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
              ContinueButton(
                  context: context,
                  nextPage: const SignUpName(),
                  text: "Bắt đầu"),
              const SizedBox(
                height: 10,
              ),
              buildHadAccountButton(),
            ],
          ),
        ));
  }

  Widget buildBeginButton(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignUpName()));
        },
        style: CustomButtonStyle.roundBorderButton(30.0),
        child: const Text("Bắt đầu"),
      ),
    );
  }

  Widget buildHadAccountButton() {
    return SizedBox(
      height: 40.0,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: CustomButtonStyle.roundBorderButton(30.0),
        child: const Text("Tôi có tài khoản rồi"),
      ),
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

class Template extends StatelessWidget {
  final Widget child;
  const Template({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
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
      ),
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
          ContinueButton(context: context, nextPage: const SignUpBirthday())
        ],
      ),
    );
  }
}

class SignUpBirthday extends StatefulWidget {
  const SignUpBirthday({super.key});
  static const message =
      "Chọn ngày sinh của bạn. Bạn luôn có thể đặt thông tin này ở chế độ riêng tư vào lúc khác.";
  static const message2 = "Tại sao tôi cần cung cấp ngày sinh của mình?";

  @override
  State<SignUpBirthday> createState() => _SignUpBirthdayState();
}

class _SignUpBirthdayState extends State<SignUpBirthday> {
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
          Text(SignUpBirthday.message,
            style: CustomTextStyle.normalStyle),
          Text(SignUpBirthday.message2,
            style: CustomTextStyle.normalStyle),
          const SizedBox(
            height: 10,
          ),
          buildDatePicker(context),
          const SizedBox(
            height: 10,
          ),
          ContinueButton(context: context, nextPage: const SignUpEmail())
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
                  style: CustomTextStyle.normalStyle.merge(const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
            TextSpan(
              text: message2,
              style: TextStyle(color: Colors.grey)
            ),
            TextSpan(
              text: "Tìm hiểu thêm", 
              style: TextStyle(color: Colors.blue))
          ])),
          const SizedBox(
            height: 10,
          ),
          ContinueButton(context: context, nextPage: const PasswordSignUp())
        ],
      ),
    );
  }
}

class PasswordSignUp extends StatelessWidget {
  const PasswordSignUp({super.key});
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
          ContinueButton(context: context)
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
