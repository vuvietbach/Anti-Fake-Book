//Lib
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

//module
import 'package:anti_fake_book/store/reducers/index.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/plugins/index.dart';
import 'package:anti_fake_book/services/notification_service.dart';
import 'package:anti_fake_book/services/save_to_disk_service.dart';
import 'package:anti_fake_book/models/cached_http_request.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DiskStore.init();
  final initialState =
      await DiskStore.loadAndMergeState(AntiFakeBookState.initState());
  await NotificationService.init();
  await initCached();
  Plugins.antiFakeBookStore = Store<AntiFakeBookState>(antiFakeBookReducers,
      initialState: initialState, middleware: [futureMiddleware]);
  runApp(AntiFakeBookApp(store: Plugins.antiFakeBookStore!));
}

class AntiFakeBookApp extends StatelessWidget {
  final Store<AntiFakeBookState> store;
  const AntiFakeBookApp({Key? key, required this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AntiFakeBookState>(
        store: store,
        child: MaterialApp.router(localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ], supportedLocales: const [
          Locale('en', ''),
          Locale('vi', ''),
        ], debugShowCheckedModeBanner: false, routerConfig: Plugins.goRouter));
  }
}
