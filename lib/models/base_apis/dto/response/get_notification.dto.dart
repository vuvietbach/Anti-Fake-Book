import 'package:anti_fake_book/constants/notification.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_notification.dto.g.dart';

@customJsonSerializable
class GetNotificationReponseDto extends ResponseDTO {
  GetNotificationReponseDto() : super();
  NotificationPayloadDto data = NotificationPayloadDto();
  DateTime lastUpdate = DateTime.now();
  int badge = 0;
  factory GetNotificationReponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationReponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetNotificationReponseDtoToJson(this);
}

@customJsonSerializable
class NotificationPayloadDto {
  @JsonKey()
  TypeNotification type = TypeNotification.comment;
  String objectId = '';
  String title = '';
  String notificationId = '';
  DateTime created = DateTime.now();
  String avatar = '';
  @JsonKey()
  TypeGroup group = TypeGroup.notification;
  @JsonKey()
  ReadType read = ReadType.unread;
  NotificationPayloadDto();
  factory NotificationPayloadDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationPayloadDtoToJson(this);
}
