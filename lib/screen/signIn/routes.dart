import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/screen/signIn/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRoute signInRoutes = GoRoute(
    path: 'sign-in',
    builder: (BuildContext context, GoRouterState state) {
      return const EmptyLayout(child: SignIn());
    },
    routes: [
      GoRoute(
        path: 'account',
        builder: (BuildContext context, GoRouterState state) {
          return const EmptyLayout(child: SignInWithAccount());
        },
      ),
    ]);
