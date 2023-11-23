import 'package:flutter/material.dart';

Widget createTextButton(
    {ButtonStyle? style,
    required void Function() onPressed,
    Widget? child,
    String title = '',
    bool isDisable = false,
    bool haveBoder = false,
    Decoration? decoration}) {
  final defaultStyle = ElevatedButton.styleFrom(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      disabledBackgroundColor: Colors.transparent);
  return Container(
    decoration: haveBoder
        ? BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
          )
        : decoration,
    margin: const EdgeInsets.all(0),
    child: ElevatedButton(
      style: style ?? defaultStyle,
      onPressed: isDisable ? null : onPressed,
      child: child ??
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
    ),
  );
}
