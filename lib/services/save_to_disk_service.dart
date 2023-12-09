import 'dart:io';

import 'package:anti_fake_book/models/saved_state.dto.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:path_provider/path_provider.dart';

class DiskStore {
  static late Directory _appDocDir;
  static late String filePath;
  static Future<void> init() async {
    _appDocDir = await getApplicationDocumentsDirectory();
    filePath = "${_appDocDir.path}/state.json";
    writeJson(filePath, {"email": "hello", "token": "", "username": ""});
  }

  static Future<AntiFakeBookState> loadAndMergeState(
      AntiFakeBookState prevState) async {
    var savedState1 = await readJson(filePath);
    SavedState savedState2 = SavedState.fromJson(savedState1);

    return prevState.copyWith(
        userState: prevState.userState.copyWith(
            email: savedState2.email,
            token: savedState2.token,
            username: savedState2.username));
  }

  static Future<void> saveState(AntiFakeBookState state) async {
    final data = {
      "email": state.userState.email,
      "token": state.userState.token,
      "username": state.userState.username
    };
    await writeJson(filePath, data);
  }
}
