import 'package:flutter/material.dart';

class CommonAppBar extends AppBar {
  CommonAppBar(
      {super.key,
      required String title,
      required BuildContext context,
      List<Widget> actions = const [],
      bool isShowLeading = true,
      onPressedLeading})
      : super(
          title: Text(title),
          leading: isShowLeading
              ? IconButton(
                  onPressed: onPressedLeading ??
                      () {
                        Navigator.pop(context);
                      },
                  icon: const Icon(Icons.arrow_back))
              : null,
          centerTitle: false,
          actions: actions,
        );
}
