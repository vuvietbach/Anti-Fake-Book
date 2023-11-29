
import 'package:json_annotation/json_annotation.dart';
part 'notification.dto.g.dart';

@JsonSerializable()
class GetNotificationRequest {
  final String token;
  final int index;
  final int count;
  GetNotificationRequest({required this.token, required this.index, required this.count});
  
  factory GetNotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetNotificationRequestToJson(this);
}


@JsonSerializable()
class SetReadNotificationRequest {
  final String token;
  @JsonKey(name: "notification_id")
  final String notificationId;

  SetReadNotificationRequest({required this.token, required this.notificationId});
  
  factory SetReadNotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$SetReadNotificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetReadNotificationRequestToJson(this);
}

@JsonSerializable()
class SetDevTokenRequest {
  final String token;
  final String devtoken;
  final String devtype;

  SetDevTokenRequest(this.devtype, {required this.token, required this.devtoken});
  
  Map<String, dynamic> toJson() => _$SetDevTokenRequestToJson(this);

  factory SetDevTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$SetDevTokenRequestFromJson(json);
}

@JsonSerializable()
class SetUserInfoRequest {
  final String token;
  final String? username;
  final String? description;
  final String? avatar;
  final String? address;
  final String? city;
  final String? country;
  @JsonKey(name: "cover_image")
  final String? coverImage;
  final String? link;

  SetUserInfoRequest({required this.token, this.username, this.description, this.avatar, this.address, this.city, this.country, this.coverImage, this.link});
  
  Map<String, dynamic> toJson() => _$SetUserInfoRequestToJson(this);

  factory SetUserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$SetUserInfoRequestFromJson(json);
}