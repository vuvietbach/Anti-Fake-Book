import 'package:anti_fake_book/layout/Empty.dart';
import 'package:anti_fake_book/screen/profile/friendList.dart';
import 'package:anti_fake_book/screen/profile/profile.dart';
import 'package:anti_fake_book/screen/profile/profileSetting.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRoute profileRoutes = GoRoute(
    path: 'profile',
    builder: (BuildContext context, GoRouterState state) {
      return const EmptyLayout(child: ProfilePage());
    },
    routes: [
      GoRoute(
        path: 'setting',
        builder: (BuildContext context, GoRouterState state) {
          return const EmptyLayout(child: ProfileSetting());
        },
      ),
      GoRoute(
        path: "change_setting",
        builder: (context, state) => const EmptyLayout(),
      ),
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
