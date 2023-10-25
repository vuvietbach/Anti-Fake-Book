import 'package:anti_fake_book/constants/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeFake extends StatelessWidget {
  const HomeFake({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Button Demo',
      theme: ThemeData(
        primaryColor: lightBlueColor, // Màu chủ đạo
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home page demo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              context.go('/post/create');
            },
            child: const Text(
              'Đăng bài',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
