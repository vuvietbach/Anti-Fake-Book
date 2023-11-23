
import 'package:anti_fake_book/store/state/app.dart';
import 'package:anti_fake_book/store/state/post.dart';
import 'package:anti_fake_book/store/state/user.dart';
import 'package:anti_fake_book/utils.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'index.freezed.dart';
part 'index.g.dart';

@freezed
class AntiFakeBookState with _$AntiFakeBookState {
  @customJsonSerializable
  factory AntiFakeBookState({
    required AppState appState,
    required PostState postState,
    required UserState userState,
  }) = _AntiFakeBookState;

  factory AntiFakeBookState.initState() => AntiFakeBookState(
        appState: AppState(),
        postState: PostState(),
        userState: UserState(),
      );

  factory AntiFakeBookState.fromJson(Map<String, dynamic> json) =>
      _$AntiFakeBookStateFromJson(json);
}
