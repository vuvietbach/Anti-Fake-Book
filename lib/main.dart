import 'package:anti_fake_book/screen/CreatePost.dart';
import 'package:anti_fake_book/screen/HomeFake.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:anti_fake_book/layout/Empty.dart';

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

void main() {
  runApp(MaterialApp.router(
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ], 
    supportedLocales: const [
      Locale('en', ''),
      Locale('vi', ''),], 
    debugShowCheckedModeBanner: false,
    routerConfig: _router
  ));
}