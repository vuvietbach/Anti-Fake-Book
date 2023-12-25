import 'dart:io';

import 'package:anti_fake_book/models/base_apis/apis.dart';
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
    var savedState = await readJson(filePath);
    // print("loadAndMergeState: $savedState");
    try {
      final state = AntiFakeBookState.fromJson(savedState);
      ApiModel.token = state.token;
      return state;
    } catch (e) {
      return prevState;
    }
  }

  static Future<void> saveState(AntiFakeBookState state) async {
    final data = state.toJson();
    // print("saveState: $data");
    await writeJson(filePath, data);
  }
}
