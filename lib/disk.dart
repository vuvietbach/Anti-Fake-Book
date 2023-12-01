import 'package:anti_fake_book/store/state/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiskStore {
  static late SharedPreferences _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static AntiFakeBookState loadAndMergeState(AntiFakeBookState prevState) {
    final Map<String, dynamic> savedState = {};
    savedState["email"] = _prefs.getString("email") ?? "";
    savedState["token"] = _prefs.getString("token") ?? "";
    savedState["username"] = _prefs.getString("username") ?? "";
    return prevState.copyWith(
        userState: prevState.userState.copyWith(
            email: savedState['email'],
            token: savedState['token'],
            username: savedState['username']));
  }

  static Future<void> saveState(AntiFakeBookState state) async {
    await _prefs.setString("email", state.userState.email);
    await _prefs.setString("token", state.userState.token);
    await _prefs.setString("username", state.userState.username);
  }
}
