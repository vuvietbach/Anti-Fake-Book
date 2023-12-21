import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/screen/profile/change_setting/change_setting.dart';
import 'package:anti_fake_book/screen/profile/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final profileRoutes = [
  GoRoute(
      path: 'profile_setting/:userId',
      builder: (BuildContext context, GoRouterState state) {
        return EmptyLayout(
            child: ProfileSettingPage(
          userId: state.pathParameters['userId'] ?? "",
        ));
      }),
  GoRoute(
    path: "change_profile_setting",
    builder: (context, state) => const EmptyLayout(
      child: ChangeSettingPage(),
    ),
  ),
];
