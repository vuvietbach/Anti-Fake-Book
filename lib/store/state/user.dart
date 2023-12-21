import 'package:anti_fake_book/global_type/user/user_summary.entity.dart';
import 'package:anti_fake_book/store/state/user_info.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

const _defaultUserInfo = UserInfo();

@unfreezed
class UserState with _$UserState {
  @customJsonSerializable
  factory UserState({
    @Default(_defaultUserInfo) UserInfo userInfo,
    @Default(_defaultUserInfo) UserInfo searchedUserInfo,
    @Default([]) List<UserSummaryEntity> blocks,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}

void main() {
  final user = UserState();
  // print(user.copyWith(coins: 10));
}
