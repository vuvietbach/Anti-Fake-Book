import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sign_up.dart';

final GoRoute signUpRoutes = GoRoute(
  path: 'sign-up',
  builder: (BuildContext context, GoRouterState state) {
    return const EmptyLayout(child: SignUp());
  },
);
