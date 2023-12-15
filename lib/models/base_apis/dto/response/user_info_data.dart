import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_info_data.freezed.dart';
part 'user_info_data.g.dart';

@freezed
class UserInfoData with _$UserInfoData {
  const UserInfoData._();
  @customJsonSerializable
  const factory UserInfoData({
    @Default(null) String? id,
    @Default(null) String? username,
    @Default(null) String? created,
    @Default(null) String? description,
    @Default(null) String? avatar,
    @Default(null) String? coverImage,
    @Default(null) String? link,
    @Default(null) String? address,
    @Default(null) String? city,
    @Default(null) String? country,
    @Default(null) String? email,
    @Default(null) int? listing,
    @Default(null) int? isFriend,
    @Default(null) int? online,
    @Default(null) int? coins,
  }) = _UserInfoData;

  factory UserInfoData.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDataFromJson(json);
}

const DEFAULT_USER_INFO_DATA = UserInfoData(
  id: "",
  username: "",
  created: "",
  description: "",
  avatar: "",
  coverImage: "",
  link: "",
  address: "",
  city: "",
  country: "",
  email: "",
  listing: 0,
  isFriend: 0,
  online: 0,
  coins: 0,
);
