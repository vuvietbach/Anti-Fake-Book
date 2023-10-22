import 'package:flutter/material.dart';

class EmptyLayout extends StatelessWidget {
  final Widget? child;

  const EmptyLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Giao diện của widget cha
      child: child, // Thêm widget con vào đây
    );
  }
}
