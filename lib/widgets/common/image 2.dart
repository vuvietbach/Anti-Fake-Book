import 'dart:ffi';

import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final double width;
  final double height;
  final ImageProvider? image;

  const CoverImage(
      {super.key,
      this.width = double.infinity,
      this.height = 300.0,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: (image != null)
            ? DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              )
            : null,
        color: Colors.grey,
      ),
    );
  }
}
