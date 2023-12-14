import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class AuthState with _$AuthState {
  @customJsonSerializable
  factory AuthState({
    @Default("") String email,
    @Default("") String password,
    @Default("") String uuid,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}