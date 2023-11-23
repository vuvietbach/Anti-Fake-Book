import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:anti_fake_book/utils.dart';

import './SignUp.dart';

const List<CustomRoute> _routes = [
  CustomRoute(path: "name", widget: SignUpName()),
  CustomRoute(path: "age", widget: SignUpAge()),
  CustomRoute(path: "email", widget: SignUpEmail()),
  CustomRoute(path: "password", widget: SignUpPassword()),
  CustomRoute(path: "policy", widget: Placeholder()),
  CustomRoute(path: "verify", widget: VerifyAccount()),
  CustomRoute(path: 'save-info', widget: SaveInfo()),
];

final GoRoute signUpRoutes = GoRoute(
  path: 'sign-up',
  builder: (BuildContext context, GoRouterState state) {
    return const EmptyLayout(child: SignUp());
  },
  routes: _routes
      .map((route) => GoRoute(
            path: route.path,
            builder: (context, state) => EmptyLayout(child: route.widget),
          ))
      .toList(),
);
