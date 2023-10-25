import 'package:anti_fake_book/screen/SignUp/SignUp.dart';
import 'package:anti_fake_book/widgets/buttons.dart';
import 'package:anti_fake_book/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:anti_fake_book/styles.dart';

import 'widgets.dart';
class SignIn extends StatelessWidget {
  const SignIn({Key? key});

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
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(children: [
              const SizedBox(height: 100),
              const SizedBox(height: 40, child: Image(image: AssetImage('assets/images/logo.jpeg'))),
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
                child: Text("Anti Fake Book", style: TextStyle(color: Colors.grey)),
              )
            ],),
          )
        ),
      ),
    );
  }
  Widget buildEmailField() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
    );
  }
  Widget buildPasswordField() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
    );
  }
  Widget buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        style: CustomButtonStyle.roundBorderButton(40.0),
        onPressed: () {
    
        },
        child: const Text('Sign In'),
      ),
    );
  }
  Widget buildForgotPasswordButton() {
    return TextButton(
      onPressed: () {
  
      },
      child: const Text('Forgot Password'),
    );
  }
  Widget buildCreateAccountButton() {
    return SizedBox(
      height: 40.0,
      width: double.infinity,
      child: OutlinedButton(
        style: CustomButtonStyle.roundBorderButton(30.0),
        onPressed: () {
      
        },
        child: const Text('Create Account'),
      ),
    );
  }
}
class Account {
  final String name;
  final String avatarUrl;
  const Account({required this.name, required this.avatarUrl});
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const testAcc = Account(name: "Vu Viet Bach", avatarUrl: "https://t3.ftcdn.net/jpg/03/46/83/96/240_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const SizedBox(height: 40, child: Image(image: AssetImage('assets/images/logo.jpeg'))),
            const SizedBox(height: 100),
            AccountCard(name: testAcc.name, avatarUrl: testAcc.avatarUrl),
            AccountCard(name: testAcc.name, avatarUrl: testAcc.avatarUrl),
            AccountCard(name: testAcc.name, avatarUrl: testAcc.avatarUrl),
            const SizedBox(height: 10),
            const SecondaryNavButton(nextPage: SignIn(), text: "Sign In With Other Account"),
            const Spacer(),
            buildCreateAccountButton(context),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0), 
              child: Text("Anti Fake Book", style: TextStyle(color: Colors.grey)),
            )
          ],
        ),
      ),
      
    );
  }
  Widget buildCreateAccountButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignUp()));
      },
      child: const Text("Create Account"));
  } 
}
class SignInWithAccount extends StatelessWidget {
  const SignInWithAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const SizedBox(height: 40, child: Image(image: AssetImage('assets/images/logo.jpeg'))),
            const SizedBox(height: 100),
            Text("Vu Viet Bach", style: CustomTextStyle.normalStyle,),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ), 
            const SizedBox(height: 10),
            const PrimaryNavButton(nextPage: SignInWithAccount(), text: "Sign In"),
            const ForgotPasswordButton(),
          ],
        ),
      ),
      
    );
  }
}



