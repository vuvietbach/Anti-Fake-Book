import 'dart:async';

import 'package:anti_fake_book/styles.dart';
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

// use in VerifyAccountPage
class ResendCodeButton extends StatefulWidget {
  final Function? onPressed;
  const ResendCodeButton({super.key, this.onPressed});

  @override
  State<ResendCodeButton> createState() => _ResendCodeButtonState();
}

class _ResendCodeButtonState extends State<ResendCodeButton> {
  bool _enable = true;
  int _remainingTime = 10;
  Timer? _timer;
  void onPressed() {
    //print("Hi");
    if (!_enable) return;
    widget.onPressed?.call();
    _enable = false;
    _remainingTime = 10;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        _timer?.cancel();
        _enable = true;
        _remainingTime = 10;
        setState(() {});
      } else {
        _remainingTime--;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.0,
          width: double.infinity,
          child: OutlinedButton(
            onPressed: _enable ? onPressed : null,
            style: CustomButtonStyle.roundBorderButton(30.0),
            child: const Text("Gửi lại mã"),
          ),
        ),
        !_enable
            ? Text(
                "Bạn có thể yêu cầu gửi lại mã trong vòng $_remainingTime giây")
            : Container(),
      ],
    );
  }
}
