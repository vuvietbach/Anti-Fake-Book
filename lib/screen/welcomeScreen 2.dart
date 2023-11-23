import 'package:anti_fake_book/screen/signIn/widgets.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:anti_fake_book/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const testAcc = Account(
      name: "Vu Viet Bach",
      avatarUrl:
          "https://t4.ftcdn.net/jpg/05/49/98/39/240_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const SizedBox(
                height: 40,
                child: Image(image: AssetImage('assets/images/logo.jpeg'))),
            const SizedBox(height: 100),
            AccountCard(name: testAcc.name, avatarUrl: testAcc.avatarUrl),
            AccountCard(name: testAcc.name, avatarUrl: testAcc.avatarUrl),
            AccountCard(name: testAcc.name, avatarUrl: testAcc.avatarUrl),
            const SizedBox(height: 10),
            const NavSecondaryButton(
                nextPage: "/sign-in", text: "Sign In With Other Account"),
            const Spacer(),
            buildCreateAccountButton(context),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child:
                  Text("Anti Fake Book", style: TextStyle(color: Colors.grey)),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCreateAccountButton(BuildContext context) {
    return TextButton(
        onPressed: () => context.go('/sign-up'),
        child: const Text("Create Account"));
  }
}
