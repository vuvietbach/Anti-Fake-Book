import 'dart:math';

import 'package:anti_fake_book/screen/welcome_screen/welcome_screen.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackButton;
  const TransparentAppBar({super.key, this.hasBackButton = true});

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
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  // ignore: prefer_typing_uninitialized_variables
  final TextEditingController? textEditingController;
  final bool isEnable;
  final String labelText;
  final String? initialValue;
  const PasswordField({
    super.key,
    this.onSaved,
    this.validator,
    this.textEditingController,
    this.isEnable = true,
    this.labelText = "Mật khẩu",
    this.initialValue,
    this.onChanged,
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
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      _empty = false;
    }
    return TextFormField(
      initialValue: widget.initialValue,
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
        widget.onChanged?.call(value)
      },
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
