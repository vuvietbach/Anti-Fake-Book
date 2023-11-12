import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/screen/sign_in/widgets.dart';
import 'package:anti_fake_book/services/services.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:anti_fake_book/widgets/buttons.dart';
import 'package:anti_fake_book/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:anti_fake_book/styles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late bool _isLoading;
  late String password;
  late String email;
  late bool _isSubmitting;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _isSubmitting = false;
  }

  @override
  void dispose() {
    // Cancel or dispose of asynchronous resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 100),
                      const SizedBox(
                          height: 40,
                          child: Image(
                              image: AssetImage('assets/images/logo.jpeg'))),
                      const SizedBox(height: 100),
                      TextFormField(
                        enabled: !_isSubmitting,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        validator: validateEmail,
                        controller: emailController,
                      ),
                      const SizedBox(height: 10),
                      PasswordField(
                        isEnable: !_isSubmitting,
                        validator: _validatePassword,
                        textEditingController: passwordController,
                      ),
                      const SizedBox(height: 10),
                      signInButton(context),
                      const SizedBox(height: 5),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Quên mật khẩu?'),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      _createNewAccountButton(context),
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
        }));
  }

  String? _validatePassword(String? value) {
    String? result = validatePassword(value);
    if (result != null) {
      return result;
    } else if (value == emailController.text) {
      return 'Mật khẩu không được trùng với email';
    } else {
      return null;
    }
  }

  Widget signInButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        style: CustomButtonStyle.roundBorderButton(40.0),
        onPressed: _isSubmitting
            ? null
            : () async {
                FocusManager.instance.primaryFocus?.unfocus();
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _isSubmitting = true;
                  });
                  String uuid = await getDeviceId(context);
                  email = emailController.text;
                  password = passwordController.text;
                  var response = await signIn(email, password, uuid);
                  // TODO: handle request time out or no internet connection
                  // TODO: handle wrong password. But there is not error code for wrong password
                  // TODO: make sure error code for wrong email is 9995
                  // handle succes
                  setState(() {
                    _isSubmitting = false;
                  });
                  if (response.code == "1000") {
                    // ignore: use_build_context_synchronously
                    context.go("/");
                  } else if (response.code == "9995") {
                    // ignore: use_build_context_synchronously
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text("Email không tồn tại"),
                              content: const Text("Vui lòng kiểm tra lại email"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Đóng"))
                              ],
                            ));
                  }
                }
              },
        child: const Text('Đăng nhập'),
      ),
    );
  }

  Widget _createNewAccountButton(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: double.infinity,
      child: OutlinedButton(
        style: CustomButtonStyle.roundBorderButton(30.0),
        onPressed: () => context.go("/sign-up"),
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
