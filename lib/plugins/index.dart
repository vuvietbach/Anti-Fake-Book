import 'package:anti_fake_book/plugins/go_router.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class Plugins {
  static Store<AntiFakeBookState>? antiFakeBookStore;
  static GoRouter goRouter = router;
}
