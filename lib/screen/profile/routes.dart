import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/screen/profile/change_setting/change_setting.dart';
import 'package:anti_fake_book/screen/profile/friend_list.dart';
import 'package:anti_fake_book/screen/profile/profile.dart';
import 'package:anti_fake_book/screen/profile/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRoute profileRoutes = GoRoute(
    path: 'profile',
    builder: (BuildContext context, GoRouterState state) {
      return const EmptyLayout(
          child: ProfilePage(
        userId: "",
      ));
    },
    routes: [
      GoRoute(
          path: 'setting',
          builder: (BuildContext context, GoRouterState state) {
            return const EmptyLayout(child: ProfileSetting());
          },
          routes: [
            GoRoute(
              path: "change_setting",
              builder: (context, state) => const EmptyLayout(
                child: ChangeSettingPage(),
              ),
            ),
            // GoRoute(path: )
          ]),
      GoRoute(
        path: "friend_list",
        builder: (context, state) => const EmptyLayout(
          child: FriendList(),
        ),
      ),
      GoRoute(
          path: "friend_request",
          builder: (context, state) => const EmptyLayout())
    ]);
