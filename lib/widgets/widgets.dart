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

class PasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  // ignore: prefer_typing_uninitialized_variables
  final TextEditingController? textEditingController;
  final bool isEnable;
  final String labelText;
  const PasswordField({
    super.key,
    this.onSaved,
    this.validator,
    this.textEditingController,
    this.isEnable = true,
    this.labelText = "Mật khẩu",
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true; // Whether the password is obscured
  bool _empty = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      enabled: widget.isEnable,
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget.labelText,
        suffixIcon: !_empty
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
      ),
      onChanged: (value) => {
        setState(() {
          _empty = value.isEmpty;
        }),
        // ignore: avoid_print
        print("Empty: $_empty")
      },
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
