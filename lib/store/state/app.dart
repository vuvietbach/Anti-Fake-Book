import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app.freezed.dart';
part 'app.g.dart';

@unfreezed
class AppState with _$AppState {
  @customJsonSerializable
  factory AppState({
    @Default(AppStatus.loaded) AppStatus status,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
