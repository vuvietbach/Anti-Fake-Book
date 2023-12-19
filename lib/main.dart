//Lib
import 'package:anti_fake_book/app_state_observer.dart';
import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/screen/profile/profile.dart';
import 'package:anti_fake_book/services/save_to_disk_service.dart';
import 'package:anti_fake_book/services/notification_service.dart';
import 'package:anti_fake_book/models/cached_http_request.dart';
import 'package:anti_fake_book/screen/HomePage/HomeFake.dart';
import 'package:anti_fake_book/screen/posts/report_post/confirm_report.dart';
import 'package:anti_fake_book/screen/posts/report_post/report_post.dart';
import 'package:anti_fake_book/screen/profile/routes.dart';
import 'package:anti_fake_book/screen/search_page/search_page.dart';
import 'package:anti_fake_book/screen/sign_in/routes.dart';
import 'package:anti_fake_book/screen/sign_up/routes.dart';
import 'package:anti_fake_book/screen/welcome_screen/welcome_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

//module
import 'package:anti_fake_book/screen/posts/create_post.dart';
import 'package:anti_fake_book/screen/posts/emotion_list.dart';
import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/store/reducers/index.dart';
import 'package:anti_fake_book/store/state/index.dart';

import 'layout/home_page.dart';

final GoRouter _router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState stage) {
        // return const EmptyLayout(child: CheckLoginWrapper(child: HomePage()));
        return const EmptyLayout(
          // child: ChangeProfileAfterSignUpPage(email: "b4@email.com"),
          child: ProfilePage(),
        );
      },
      routes: [
        GoRoute(
            path: 'create-post',
            builder: (BuildContext context, GoRouterState stage) =>
                const EmptyLayout(child: CreatePostScreen()),
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
        GoRoute(
          path: 'search',
          builder: (BuildContext context, GoRouterState stage) =>
              const SearchPage(),
        ),
        ...profileRoutes,
      ]),
]);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DiskStore.init();
  final initialState =
      await DiskStore.loadAndMergeState(AntiFakeBookState.initState());
  await NotificationService.init();
  await initCached();
  final store = Store<AntiFakeBookState>(antiFakeBookReducers,
      initialState: initialState, middleware: [futureMiddleware]);
  WidgetsBinding.instance.addObserver(AppStateObserver(store: store));
  ApiModel.token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDcxLCJkZXZpY2VfaWQiOiJzdHJpbmciLCJpYXQiOjE3MDMwMDQyMTZ9.TS_uh61n2ZyAwE5ub9oCtQ56-v6A80eL0WMSv_NV0rA';
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
        child: MaterialApp.router(
            theme: ThemeData.light(useMaterial3: false),
            darkTheme: ThemeData.dark(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('vi', ''),
            ],
            debugShowCheckedModeBanner: false,
            routerConfig: _router));
  }
}
