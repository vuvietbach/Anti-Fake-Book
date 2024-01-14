import 'package:anti_fake_book/services/save_to_disk_service.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class AppStateObserver extends WidgetsBindingObserver {
  AppStateObserver({required this.store});

  final Store<AntiFakeBookState> store;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      // Access the store to save information
      DiskStore.saveState(store.state);
    }
  }
}
