import 'package:anti_fake_book/states/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationState>(
        builder: (context, value, child) => ElevatedButton(
            onPressed: () async {
              try {
                await value.signOut();
                context.go('/');
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.toString()),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text("Đăng xuất")));
  }
}
