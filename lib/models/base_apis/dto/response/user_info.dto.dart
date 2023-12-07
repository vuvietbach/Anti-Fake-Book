import 'package:anti_fake_book/utils.dart';
part 'user_info.dto.g.dart';

@customJsonSerializable
class SetUserInfoResponse {
  final int code;
  final String message;
  final UserInfoData data;

  SetUserInfoResponse(
      {required this.code, required this.message, required this.data});
  factory SetUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$SetUserInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SetUserInfoResponseToJson(this);
}

@customJsonSerializable
class UserInfoData {
  final int id;
  final String username;
  final String created;
  final String description;
  final String avatar;
  final String coverImage;
  final String link;
  final String address;
  final String city;
  final String country;
  final int listing;
  final int isFriend;
  final int online;
  final int coins;

  const UserInfoData({
    this.id = -1,
    this.username = "",
    this.created = "",
    this.description = "",
    this.avatar = "",
    this.coverImage = "",
    this.link = "",
    this.address = "",
    this.city = "",
    this.country = "",
    this.listing = 0,
    this.isFriend = 0,
    this.online = 0,
    this.coins = 0,
  });
  factory UserInfoData.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoDataToJson(this);
}

@customJsonSerializable
class GetUserInfoResponse {
  final int code;
  final String message;
  final UserInfoData data;

  GetUserInfoResponse(
      {required this.code, required this.message, required this.data});
  factory GetUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserInfoResponseToJson(this);
}
