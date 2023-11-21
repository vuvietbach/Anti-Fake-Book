import 'package:flutter/material.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackButton;
  final String title;
  final Widget? backIcon;
  const TransparentAppBar(
      {super.key, this.hasBackButton = true, this.title = "", this.backIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.black,
            )
          : null,
      elevation: 0,
      title: title != "" ? Text(title) : Container(),
      actions: [
        backIcon ?? Container(),
      ],
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

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

class CustomSearchBar extends StatelessWidget {
  final String placeholder;
  const CustomSearchBar({super.key, this.placeholder = "Tìm kiếm"});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200], // Grey background color
        hintText: placeholder, // Text placeholder
        hintStyle: const TextStyle(color: Colors.grey),
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // Remove border
          borderRadius: BorderRadius.circular(30.0), // Adjust the border radius
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.clear, color: Colors.grey),
        ),
      ),
    );
  }
}
