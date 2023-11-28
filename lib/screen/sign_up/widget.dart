import 'package:anti_fake_book/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final PageController pageController;
  final bool Function()? validate;
  const ContinueButton(
      {super.key, required this.pageController, this.validate});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: "Tiếp tục",
      onPressed: () {
        if (validate?.call() ?? true) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }
}
