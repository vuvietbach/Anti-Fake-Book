import 'package:anti_fake_book/screen/sign_in/sign_in.dart';
import 'package:anti_fake_book/screen/welcome_screen/widgets.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(children: [
                      SizedBox(height: 100),
                      SizedBox(
                          height: 40,
                          child: Image(
                              image: AssetImage('assets/images/logo.jpeg'))),
                      SizedBox(height: 100),
                      AccountCard(),
                      SigninOption(
                          title: "Đăng nhập bằng tài khoản khác",
                          path: "/sign-in",
                          icon: Icons.add),
                      SigninOption(
                          title: "Tìm tài khoản",
                          path: "/sign-in",
                          icon: Icons.search)
                    ]),
                    // const Spacer(),
                    // Expanded(child: Container()),
                    Column(children: [
                      SizedBox(
                        height: 40.0,
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () => context.go('/sign-up'),
                            child: const Text("Tạo tài khoản mới")),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 12.0, top: 12.0),
                        child: Text("Anti Fake Book",
                            style: TextStyle(color: Colors.grey)),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
  // Widget _signInWithOtherAccountButton(BuildContext context) {

  // }

  Widget buildCreateAccountButton(BuildContext context) {
    return TextButton(
        onPressed: () => context.go('/sign-up'),
        child: const Text("Create Account"));
  }
}
