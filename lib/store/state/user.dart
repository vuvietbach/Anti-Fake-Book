import 'package:anti_fake_book/models/base_apis/dto/response/user_info.dto.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

const _defaultUserInfoData = UserInfoData();

@unfreezed
class UserState with _$UserState {
  @customJsonSerializable
  factory UserState({
    @Default("") String email,
    @Default("") String token,
    @Default("") String username,
    @Default("") String avatar,
    @Default(_defaultUserInfoData) UserInfoData userInfo,
    @Default(_defaultUserInfoData) UserInfoData searchedUserInfo,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}

void main() {
  final user = UserState();
  // print(user.copyWith(coins: 10));
}
