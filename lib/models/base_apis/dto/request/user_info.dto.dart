import 'package:anti_fake_book/utils.dart';
part 'user_info.dto.g.dart';

class ChangeInfoAfterSignUpRequest {
  final String token;
  final String username;
  // TODO: add upload file avatar
  ChangeInfoAfterSignUpRequest({required this.token, required this.username});
}

@customJsonSerializable
class SetUserInfoRequest {
  final String token;
  final String? username;
  final String? description;
  final String? avatar;
  final String? address;
  final String? city;
  final String? country;
  final String? coverImage;
  final String? link;

  SetUserInfoRequest(
      {required this.token,
      this.username,
      this.description,
      this.avatar,
      this.address,
      this.city,
      this.country,
      this.coverImage,
      this.link});

  Map<String, dynamic> toJson() => _$SetUserInfoRequestToJson(this);

  factory SetUserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$SetUserInfoRequestFromJson(json);
}

@customJsonSerializable
class GetUserInfoRequest {
  final String token;
  final String? userId;

  GetUserInfoRequest({required this.token, this.userId});

  Map<String, dynamic> toJson() => _$GetUserInfoRequestToJson(this);

  factory GetUserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoRequestFromJson(json);
}
