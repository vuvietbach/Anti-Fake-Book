import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@unfreezed
class UserState with _$UserState {
  @customJsonSerializable
  factory UserState({
    @Default("") String id,
    @Default("") String username,
    @Default("") String email,
    @Default("") String token,
    @Default("") String avatar,
    @Default(0) int active,
    @Default(0) int coins,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}

void main() {
  final user = UserState();
  print(user.copyWith(coins: 10));
}
