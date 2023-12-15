import 'package:anti_fake_book/utils.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification.dto.g.dart';

@customJsonSerializable
class GetNotificationRequest {
  final String token;
  final int index;
  final int count;
  GetNotificationRequest(
      {required this.token, required this.index, required this.count});

  factory GetNotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetNotificationRequestToJson(this);
}

@customJsonSerializable
class SetReadNotificationRequest {
  final String token;
  @JsonKey(name: "notification_id")
  final String notificationId;

  SetReadNotificationRequest(
      {required this.token, required this.notificationId});

  factory SetReadNotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$SetReadNotificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetReadNotificationRequestToJson(this);
}

@customJsonSerializable
class SetDevTokenRequest {
  final String token;
  final String devtoken;
  final String devtype;

  SetDevTokenRequest(this.devtype,
      {required this.token, required this.devtoken});

  Map<String, dynamic> toJson() => _$SetDevTokenRequestToJson(this);

  factory SetDevTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$SetDevTokenRequestFromJson(json);
}
