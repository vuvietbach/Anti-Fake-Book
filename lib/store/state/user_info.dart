import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.g.dart';
part 'user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  const UserInfo._();
  @customJsonSerializable
  const factory UserInfo({
    @Default("") String id,
    @Default("") String username,
    @Default("") String created,
    @Default("") String description,
    @Default("") String avatar,
    @Default("") String coverImage,
    @Default("") String link,
    @Default("") String address,
    @Default("") String city,
    @Default("") String country,
    @Default("") String email,
    @Default(0) int listing,
    @Default(0) int isFriend,
    @Default(0) int online,
    @Default(0) int coins,
    @Default(0) int active,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
