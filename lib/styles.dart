import 'package:flutter/material.dart';

class CustomButtonStyle {
  static const mediumButtonHeight = 40.0;
  static ButtonStyle roundBorderButton(double radius) => ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
  );
  // static final ButtonStyle unstyledButton = ButtonStyle(

  // )
}
class CustomTextStyle {
  static TextStyle titleStyle = const TextStyle(
    fontSize: 25.0,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w900,
  );
  static TextStyle normalStyle = const TextStyle(
    fontSize: 16.0,
  );
}
class CustomText {
  static Text titleText(String text) => Text(
    text,
    style: CustomTextStyle.titleStyle,
  );
  static Text normalText(String text) => Text(
    text,
    style: CustomTextStyle.normalStyle,
  );
}

class LeftAlign extends StatelessWidget {
  final Widget child;
  const LeftAlign({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}