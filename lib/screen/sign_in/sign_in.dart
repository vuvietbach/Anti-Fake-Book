import 'package:anti_fake_book/states/auth.dart';
import 'package:anti_fake_book/widgets/buttons.dart';
import 'package:anti_fake_book/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:anti_fake_book/styles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final bool _isLoading = false;
  String? password;
  String? email;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CircularProgressIndicator()
        : Form(
            key: _formKey,
            child: Scaffold(
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
                body: LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(height: 100),
                              const SizedBox(
                                  height: 40,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/logo.jpeg'))),
                              const SizedBox(height: 100),
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Mật khẩu',
                                ),
                              ),
                              const SizedBox(height: 10),
                              _signInButton(context),
                              const SizedBox(height: 5),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Quên mật khẩu?'),
                              ),
                              const Spacer(),
                              _createNewAccountButton(),
                              const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("Anti Fake Book",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          );
  }

  Widget buildEmailField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
      validator: (email) {
        if (email == null || email.isEmpty) {
          return 'Vui lòng nhập email';
        }
        if (!EmailValidator.validate(email)) {
          return 'Email không hợp lệ';
        }
        return null;
      },
      onSaved: (newValue) {
        setState(() {
          email = newValue;
        });
      },
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Mật khẩu',
      ),
      obscureText: true,
      validator: (password) {
        if (password == null || password.isEmpty) {
          return 'Vui lòng nhập mật khẩu';
        }
        return null;
      },
      onSaved: (newValue) => setState(() {
        password = newValue;
      }),
    );
  }

  Widget _signInButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        style: CustomButtonStyle.roundBorderButton(40.0),
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: const Text('Đăng nhập'),
      ),
    );
  }

  Widget _createNewAccountButton() {
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
