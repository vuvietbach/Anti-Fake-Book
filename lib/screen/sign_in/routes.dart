import 'package:anti_fake_book/layout/Empty.dart';
import 'package:anti_fake_book/screen/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final signInRoutes = [
  GoRoute(
    path: 'sign-in',
    builder: (BuildContext context, GoRouterState state) {
      return const EmptyLayout(child: SignIn());
    },
  ),
  GoRoute(
    path: 'sign-in-with-account',
    builder: (BuildContext context, GoRouterState state) {
      return const EmptyLayout(child: SignInWithAccount());
    },
  ),
];
