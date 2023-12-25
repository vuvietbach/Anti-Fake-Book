import 'package:anti_fake_book/constants/notification.dart';
import 'package:anti_fake_book/global_type/user/user_summary.entity.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_notification.dto.g.dart';

@customJsonSerializable
class GetNotificationReponseDto extends ResponseDTO {
  GetNotificationReponseDto() : super();
  List<NotificationPayloadDto> data = [];
  DateTime lastUpdate = DateTime.now();
  int badge = 0;
  factory GetNotificationReponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationReponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetNotificationReponseDtoToJson(this);
}

@customJsonSerializable
class NotificationPayloadDto {
  String type = '0';
  String objectId = '';
  String title = 'test notification';
  String notificationId = '';
  DateTime created = DateTime.now();
  String avatar =
      'https://youtooz.com/cdn/shop/products/4r5m1q4r16.png?v=1698780965';
  String group = '0';
  String read = '0';
  UserNotification? user;
  PostNotification? post;
  NotificationPayloadDto();
  factory NotificationPayloadDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationPayloadDtoToJson(this);
}

@customJsonSerializable
class UserNotification {
  String id = '';
  String username = '';
  String avatar = '';
  UserNotification();
  factory UserNotification.fromJson(Map<String, dynamic> json) =>
      _$UserNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$UserNotificationToJson(this);
}

@customJsonSerializable
class PostNotification {
  String id = "1";
  String described = "kiếm người yêu đi phượt";
  String status = 'happy';
  PostNotification();
  factory PostNotification.fromJson(Map<String, dynamic> json) =>
      _$PostNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$PostNotificationToJson(this);
}
