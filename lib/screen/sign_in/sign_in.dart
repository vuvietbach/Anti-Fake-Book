import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/auth.dto.dart';
import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:anti_fake_book/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:anti_fake_book/styles.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late String password;
  late String email;
  late bool _isSubmitting;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _isSubmitting = false;
  }

  @override
  void dispose() {
    // Cancel or dispose of asynchronous resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
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
    });
  }

  Widget signInButton(BuildContext context) {
    return StoreBuilder(
      builder: (BuildContext context, Store<AntiFakeBookState> store) {
        return SizedBox(
          width: double.infinity,
          height: 40.0,
          child: ElevatedButton(
            style: CustomButtonStyle.roundBorderButton(40.0),
            onPressed: _isSubmitting
                ? null
                : () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (_formKey.currentState!.validate() || true) {
                      SignInRequest signInData = SignInRequest(
                          email: emailController.text,
                          password: passwordController.text);
                      store.dispatch(SignInAction(
                          data: signInData,
                          onSuccess: () {
                            context.go("/home");
                          },
                          onPending: () {
                            showLoadingDialog(context);
                          }));
                    }
                  },
            child: const Text('Đăng nhập'),
          ),
        );
      },
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
