import 'package:anti_fake_book/screen/posts/mark.dart';
import 'package:anti_fake_book/screen/profile/friend_list.dart';
import 'package:anti_fake_book/screen/profile/profile.dart';
import 'package:anti_fake_book/screen/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/layout/home_page.dart';
import 'package:anti_fake_book/screen/HomePage/HomeFake.dart';
import 'package:anti_fake_book/screen/HomePage/menu_subtab/setting.dart';
import 'package:anti_fake_book/screen/HomePage/menu_subtab/settting_subtab/block_user.dart';
import 'package:anti_fake_book/screen/HomePage/menu_subtab/settting_subtab/change_name.dart';
import 'package:anti_fake_book/screen/HomePage/menu_subtab/settting_subtab/change_password.dart';
import 'package:anti_fake_book/screen/HomePage/menu_subtab/settting_subtab/notification.dart';
import 'package:anti_fake_book/screen/posts/create_post.dart';
import 'package:anti_fake_book/screen/posts/emotion_list.dart';
import 'package:anti_fake_book/screen/posts/report_post/confirm_report.dart';
import 'package:anti_fake_book/screen/posts/report_post/report_post.dart';
import 'package:anti_fake_book/screen/profile/routes.dart';
import 'package:anti_fake_book/screen/search_page/search_page.dart';
import 'package:anti_fake_book/screen/sign_up/routes.dart';
import 'package:anti_fake_book/screen/welcome_screen/welcome_screen.dart';

import '../screen/HomePage/friend_tab.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState stage) {
        // return const EmptyLayout(child: FriendListPage(username: "toi",));
        return const EmptyLayout(
          child: HomePage(),
        );
      },
      routes: [
        GoRoute(
            path: 'create-post',
            builder: (BuildContext context, GoRouterState stage) {
              final String? postId = stage.extra as String?;
              return EmptyLayout(child: CreatePostScreen(postId: postId));
            },
            routes: [
              GoRoute(
                path: 'emotions',
                builder: (BuildContext context, GoRouterState stage) =>
                    const EmotionsList(),
              )
            ]),
        GoRoute(
            path: 'post/:id',
            builder: (BuildContext context, GoRouterState stage) {
              return const HomeFake();
            },
            routes: [
              GoRoute(
                  path: 'comment',
                  builder: (BuildContext context, GoRouterState stage) {
                    final String postId = stage.pathParameters['id'] ?? '';
                    return MarkPostScreenWidget(
                      postId: postId,
                    );
                  }),
              GoRoute(
                  path: 'report',
                  builder: (BuildContext context, GoRouterState stage) =>
                      const ReportPostScreenWidget(),
                  routes: [
                    GoRoute(
                        path: 'confirm',
                        builder: (BuildContext context, GoRouterState stage) {
                          final List<String> listSelectedReason =
                              stage.extra as List<String>? ?? ['tuan', 'tu'];

                          final String postId =
                              stage.pathParameters['id'] ?? '';
                          return EmptyLayout(
                            child: ConfirmReportScreen(
                                postId: postId,
                                listSelectedReason: listSelectedReason),
                          );
                        })
                  ]),
            ]),
        GoRoute(
            path: 'setting',
            builder: (BuildContext context, GoRouterState stage) {
              return EmptyLayout(child: SettingScreen());
            },
            routes: [
              GoRoute(
                  path: 'change-name',
                  name: 'change-name',
                  builder: (BuildContext context, GoRouterState stage) {
                    return EmptyLayout(child: ChangeNameScreen());
                  }),
              GoRoute(
                  path: 'change-password',
                  name: 'change-password',
                  builder: (BuildContext context, GoRouterState stage) {
                    return EmptyLayout(child: ChangePasswordScreen());
                  }),
              GoRoute(
                  path: 'notification',
                  name: 'setting-notification',
                  builder: (BuildContext context, GoRouterState stage) {
                    return EmptyLayout(child: NotificationSetting());
                  }),
              GoRoute(
                  path: 'block-user',
                  name: 'block-user',
                  builder: (BuildContext context, GoRouterState stage) {
                    return EmptyLayout(child: BlockUsersScreen());
                  })
            ]),
        GoRoute(
          path: 'welcome',
          builder: (BuildContext context, GoRouterState stage) {
            return const EmptyLayout(child: WelcomeScreen());
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) =>
              const EmptyLayout(child: HomePage()),
        ),
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
        signUpRoutes,
        GoRoute(
          path: 'search',
          builder: (BuildContext context, GoRouterState stage) =>
              const SearchPage(),
        ),
        GoRoute(
            path: 'profile/:userId',
            builder: (context, state) {
              return ProfilePage(userId: state.pathParameters['userId']);
            }),
        ...profileRoutes,
        GoRoute(
          path: 'friend_list',
          builder: (BuildContext context, GoRouterState state) {
            return EmptyLayout(
                child: FriendListPage(
                    username: state.uri.queryParameters['username']!,
                    userId: state.uri.queryParameters['userId']));
          },
        ),
        GoRoute(
          path: 'requested_friend',
          builder: (BuildContext context, GoRouterState stage) =>
              EmptyLayout(child: FriendPageContent()),
        ),
      ]),
]);
