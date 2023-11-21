import 'package:flutter/material.dart';

ElevatedButton createTextButton(
    {ButtonStyle? style,
    required void Function() onPressed,
    Widget? child,
    String title = '',
    bool isDisable = false}) {
  final defaultStyle = ElevatedButton.styleFrom(
    shadowColor: Colors.transparent,
    disabledBackgroundColor: Colors.transparent,
  );
  return ElevatedButton(
    style: style ?? defaultStyle,
    onPressed: isDisable ? null : onPressed,
    child: child ?? Text(title),
  );
}
