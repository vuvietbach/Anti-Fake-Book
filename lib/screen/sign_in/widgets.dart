import 'package:anti_fake_book/styles.dart';
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

