import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String name;
  final String avatarUrl;
  const AccountCard({super.key, required this.name, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          title: Text(
            name,
            style: const TextStyle(
              fontFamily: "Roboto",
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final void Function(String? )? onSaved;
  final String? Function(String? )? validator;
  // ignore: prefer_typing_uninitialized_variables
  final TextEditingController? textEditingController;
  final bool isEnable;
  const PasswordField({
    super.key,
    this.onSaved,
    this.validator,
    this.textEditingController,
    this.isEnable = true,
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
        hintText: 'Mật khẩu',
        suffixIcon: !_empty ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ) : null,
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

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


 