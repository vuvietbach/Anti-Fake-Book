import 'dart:io';

import 'package:anti_fake_book/helper/helper.dart';
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
  }

  static Future<AntiFakeBookState> loadAndMergeState(
      AntiFakeBookState prevState) async {
    var savedStateJson = await readJson(filePath);
    SavedState savedState = SavedState.fromJson(savedStateJson);

    return prevState.copyWith(
        token: savedState.token,
        userState: prevState.userState.copyWith(userInfo: savedState.userInfo));
  }

  static Future<void> saveState(SavedState state) async {
    final data = state.toJson();
    await writeJson(filePath, data);
  }
}
