import 'package:anti_fake_book/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final PageController pageController;
  final bool Function()? validate;
  final Function? onSave;
  const ContinueButton(
      {super.key, required this.pageController, this.validate, this.onSave});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: "Tiếp tục",
      onPressed: () {
        if (validate?.call() ?? true) {
          
          FocusScope.of(context).unfocus();
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }
}
