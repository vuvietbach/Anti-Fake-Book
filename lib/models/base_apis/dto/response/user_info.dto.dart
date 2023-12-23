import 'package:anti_fake_book/models/base_apis/dto/response/user_info_data.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_info.dto.g.dart';
part 'user_info.dto.freezed.dart';

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

// @customJsonSerializable
// class UserInfoData {
//   final String? id;
//   final String? username;
//   final String? created;
//   final String? description;
//   final String? avatar;
//   final String? coverImage;
//   final String? link;
//   final String? address;
//   final String? city;
//   final String? country;
//   final String? email;
//   @JsonKey(fromJson: nullableIntfromJson)
//   final int? listing;
//   @JsonKey(fromJson: nullableIntfromJson)
//   final int? isFriend;
//   @JsonKey(fromJson: nullableIntfromJson)
//   final int? online;
//   @JsonKey(fromJson: nullableIntfromJson)
//   final int? coins;

//   const UserInfoData.defaultValue({
//     this.id = "",
//     this.username = "",
//     this.created = "",
//     this.description = "",
//     this.avatar = "",
//     this.coverImage = "",
//     this.link = "",
//     this.address = "",
//     this.city = "",
//     this.country = "",
//     this.email = "",
//     this.listing = 0,
//     this.isFriend = 0,
//     this.online = 0,
//     this.coins = 0,
//   });
//   const UserInfoData({
//     this.id,
//     this.username,
//     this.created,
//     this.description,
//     this.avatar,
//     this.coverImage,
//     this.link,
//     this.address,
//     this.city,
//     this.country,
//     this.email,
//     this.listing,
//     this.isFriend,
//     this.online,
//     this.coins,
//   });
//   factory UserInfoData.fromJson(Map<String, dynamic> json) =>
//       _$UserInfoDataFromJson(json);
//   Map<String, dynamic> toJson() => _$UserInfoDataToJson(this);
// }

@freezed
class GetUserInfoResponse with _$GetUserInfoResponse {
  const GetUserInfoResponse._();
  @customJsonSerializable
  const factory GetUserInfoResponse({
    required int code,
    required String message,
    @Default(UserInfoData()) UserInfoData data,
  }) = _GetUserInfoResponse;
  
  factory GetUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoResponseFromJson(json);

}