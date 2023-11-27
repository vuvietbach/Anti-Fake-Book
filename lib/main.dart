//Lib
import 'package:anti_fake_book/disk.dart';
import 'package:anti_fake_book/screen/sign_in/routes.dart';
import 'package:anti_fake_book/screen/sign_up/routes.dart';
import 'package:anti_fake_book/screen/welcome_screen.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:anti_fake_book/widgets/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

//module
import 'package:anti_fake_book/screen/create_post/create_post.dart';
import 'package:anti_fake_book/screen/create_post/emotion_list.dart';
import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/store/reducers/index.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'layout/home_page.dart';

final GoRouter _router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState stage) {
        return const EmptyLayout(child: CheckLoginWrapper(child: HomePage()));
      },
      routes: [
        GoRoute(
            path: 'create-post',
            builder: (BuildContext context, GoRouterState stage) =>
                const CreatePostScreen(),
            routes: [
              GoRoute(
                path: 'emotions',
                builder: (BuildContext context, GoRouterState stage) =>
                    const EmotionsList(),
              )
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
              const HomePage(),
        ),
        ...signInRoutes,
        signUpRoutes,
      ]),
]);


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences.setMockInitialValues({"email":"", "token":"", "username":""});
  await DiskStore.init();

  // await dotenv.load(fileName: ".env");
  AntiFakeBookState initialState = AntiFakeBookState.initState();
  final initState = DiskStore.loadAndMergeState(initialState);
  final store = Store<AntiFakeBookState>(antiFakeBookReducers,
      initialState: initState, middleware: [futureMiddleware]);
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
