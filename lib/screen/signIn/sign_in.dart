import 'package:anti_fake_book/widgets/buttons.dart';
import 'package:anti_fake_book/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:anti_fake_book/styles.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const SizedBox(
                  height: 40,
                  child: Image(image: AssetImage('assets/images/logo.jpeg'))),
              const SizedBox(height: 100),
              buildEmailField(),
              const SizedBox(height: 10),
              buildPasswordField(),
              const SizedBox(height: 10),
              buildSignInButton(),
              const SizedBox(height: 5),
              buildForgotPasswordButton(),
              const Spacer(),
              buildCreateAccountButton(),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Anti Fake Book",
                    style: TextStyle(color: Colors.grey)),
              )
            ],
          ),
        ));
  }

  Widget buildEmailField() {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
    );
  }

  Widget buildPasswordField() {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Mật khẩu',
      ),
    );
  }

  Widget buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        style: CustomButtonStyle.roundBorderButton(40.0),
        onPressed: () {},
        child: const Text('Đăng nhập'),
      ),
    );
  }

  Widget buildForgotPasswordButton() {
    return TextButton(
      onPressed: () {},
      child: const Text('Quên mật khẩu?'),
    );
  }

  Widget buildCreateAccountButton() {
    return SizedBox(
      height: 40.0,
      width: double.infinity,
      child: OutlinedButton(
        style: CustomButtonStyle.roundBorderButton(30.0),
        onPressed: () {},
        child: const Text('Tạo tài khoản mới'),
      ),
    );
  }
}

class SignInWithAccount extends StatelessWidget {
  const SignInWithAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const TransparentAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('assets/images/avatar.jpeg'),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              "Vu Viet Bach",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(height: 10),
            const PasswordField(),
            const SizedBox(height: 10),
            const NavPrimaryButton(nextPage: '/', text: "Đăng nhập"),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password'),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true; // Whether the password is obscured
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Mật khẩu',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
    );
  }
}
