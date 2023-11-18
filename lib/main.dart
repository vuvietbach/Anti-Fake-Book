import 'package:anti_fake_book/screen/CreatePost.dart';
import 'package:anti_fake_book/screen/sign_up/routes.dart';
import 'package:anti_fake_book/screen/profile/routes.dart';
import 'package:anti_fake_book/screen/sign_in/routes.dart';
import 'package:anti_fake_book/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

//module
import 'package:anti_fake_book/screen/create_post.dart';
import 'package:anti_fake_book/screen/SignUp/routes.dart';
import 'package:anti_fake_book/screen/signIn/routes.dart';
import 'package:anti_fake_book/screen/welcomeScreen.dart';
import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/screen/HomePage/HomeFake.dart';
import 'package:anti_fake_book/store/reducers/index.dart';
import 'package:anti_fake_book/store/state/index.dart';

final GoRouter _router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState stage) {
        return const EmptyLayout(child: WelcomeScreen());
      },
      routes: [
        GoRoute(
            path: 'post',
            builder: (BuildContext context, GoRouterState stage) =>
                CreatePostScreen(),
            routes: [
              GoRoute(
                path: 'create',
                builder: (BuildContext context, GoRouterState stage) =>
                    CreatePostScreen(),
              )
            ]),
        GoRoute(
          path: 'welcome',
          builder: (BuildContext context, GoRouterState stage) {
            return const EmptyLayout(child: WelcomeScreen());
          },
        ),
        ...signInRoutes,
        signUpRoutes,
        profileRoutes,
      ]),
]);
void main() async {
  // await dotenv.load(fileName: ".env");
  final store = Store<AntiFakeBookState>(antiFakeBookReducers,
      initialState: AntiFakeBookState.initState(),
      middleware: [futureMiddleware]);
  runApp(AntiFakeBookApp(store: store));
}

class AntiFakeBookApp extends StatelessWidget {
  final Store<AntiFakeBookState> store;
  const AntiFakeBookApp({Key? key, required this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider<AntiFakeBookState>(
        store: store,
        child: MaterialApp.router(localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ], supportedLocales: const [
          Locale('en', ''),
          Locale('vi', ''),
        ], debugShowCheckedModeBanner: false, routerConfig: _router));
  }
}
