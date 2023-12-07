import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 10.0,
      thickness: 10.0,
      color: Colors.grey,
    );
  }
}