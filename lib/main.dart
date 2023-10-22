import 'package:anti_fake_book/layout/Empty.dart';
import 'package:anti_fake_book/screen/HomeFake.dart';
import 'package:anti_fake_book/HomePage.dart';
import 'package:anti_fake_book/screen/SignIn.dart';1
import 'package:anti_fake_book/screen/SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:anti_fake_book/screen/CreatePost.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState stage) {
        return const EmptyLayout(child: HomeFake());
      },
      routes: [
        GoRoute(
            path: 'post/create',
            builder: (BuildContext context, GoRouterState stage) =>
                CreatePostScreen())
      ]),
]);

void main() => runApp(MaterialApp.router(routerConfig: _router));
