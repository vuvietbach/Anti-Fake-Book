import 'package:anti_fake_book/store/state/app.dart';
import 'package:anti_fake_book/store/state/post.dart';
import 'package:anti_fake_book/store/state/user.dart';

class AntiFakeBookState {
  late AppState appState;
  late PostState postState;
  late UserState userState;

  AntiFakeBookState.initState() {
    postState = PostState.initState();
    appState = AppState.initState();
    userState = UserState.initState();
  }
}
