import 'package:anti_fake_book/screen/sign_in/widgets.dart';
import 'package:anti_fake_book/services/api.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:anti_fake_book/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:anti_fake_book/styles.dart';
import 'package:go_router/go_router.dart';

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
                        validator: (value) =>
                            validatePassword(value, emailController.text),
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
                  await handleSignIn(
                      emailController.text, passwordController.text, context);
                  setState(() {
                    _isSubmitting = false;
                  });
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

class SignInWithAccount extends StatefulWidget {
  const SignInWithAccount({super.key});

  @override
  State<SignInWithAccount> createState() => _SignInWithAccountState();
}

class _SignInWithAccountState extends State<SignInWithAccount> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  // TODO: How to get email for current login user
  static const String fakeEmail = "bach@gmail.com";
  bool _isSubmitting = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isSubmitting = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const TransparentAppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
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
              PasswordField(
                isEnable: !_isSubmitting,
                validator: (value) => validatePassword(value, fakeEmail),
              ),
              const SizedBox(height: 10),
              SizedBox(
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
                            await handleSignIn(
                                fakeEmail, passwordController.text, context);
                            setState(() {
                              _isSubmitting = false;
                            });
                          }
                        },
                  child: const Text("Đăng nhập"),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future handleSignIn(String email, String password, BuildContext context) async {
  // TODO: handle request time out or no internet connection
  // TODO: handle wrong password. But there is not error code for wrong password
  // TODO: make sure error code for wrong email is 9995
  // * CASE 1: handle succes
  // * CASE 2: handle wrong email
  // * CASE 3: handle wrong password
  // ? What is the error code for wrong password
  // * CASE 4: handle request time out or no internet connection
  String uuid = await getDeviceId(context);
  var response = await signIn(email, password, uuid);
  if (response.code == "1000") {
    // ignore: use_build_context_synchronously
    context.go("/");
  } else if (response.code == "9995") {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Email chưa được đăng ký"),
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