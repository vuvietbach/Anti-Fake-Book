import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anti_fake_book/styles.dart';
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false, 
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
