import 'package:anti_fake_book/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavButton extends StatelessWidget {
  final String? nextPage;
  final String text;
  const NavButton({super.key, this.nextPage, required this.text});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class NavPrimaryButton extends NavButton {
  const NavPrimaryButton({super.key, super.nextPage, required super.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => context.go(nextPage ?? '/'),
        style: CustomButtonStyle.roundBorderButton(30.0),
        child: Text(text),
      ),
    );
  }
}

class NavSecondaryButton extends NavButton {
  const NavSecondaryButton(
      {super.key, required super.nextPage, required super.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => context.go(nextPage ?? '/'),
        style: CustomButtonStyle.roundBorderButton(30.0),
        child: Text(text),
      ),
    );
  }
}

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextButton(
      onPressed: null,
      child: Text('Forgot Password'),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key, this.onPressed});
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40.0,
        width: double.infinity,
        child: ElevatedButton(
            style: CustomButtonStyle.roundBorderButton(30.0),
            onPressed: onPressed as void Function()?,
            child: const Text("Tiếp tục")));
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, this.onPressed, this.text});
  final Function? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40.0,
        width: double.infinity,
        child: ElevatedButton(
            style: CustomButtonStyle.roundBorderButton(30.0),
            onPressed: onPressed as void Function()?,
            child: Text(text ?? "")));
  }
}