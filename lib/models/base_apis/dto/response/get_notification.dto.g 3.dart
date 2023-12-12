// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notification.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotificationReponseDto _$GetNotificationReponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetNotificationReponseDto()
      ..code = const CustomIntConverter().fromJson(json['code'])
      ..message = const CustomStringConvert().fromJson(json['message'])
      ..data =
          NotificationPayloadDto.fromJson(json['data'] as Map<String, dynamic>)
      ..lastUpdate = DateTime.parse(json['last_update'] as String)
      ..badge = const CustomIntConverter().fromJson(json['badge']);

Map<String, dynamic> _$GetNotificationReponseDtoToJson(
    GetNotificationReponseDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  val['data'] = instance.data.toJson();
  val['last_update'] = instance.lastUpdate.toIso8601String();
  writeNotNull('badge', const CustomIntConverter().toJson(instance.badge));
  return val;
}

NotificationPayloadDto _$NotificationPayloadDtoFromJson(
        Map<String, dynamic> json) =>
    NotificationPayloadDto()
      ..type = $enumDecode(_$TypeNotificationEnumMap, json['type'])
      ..objectId = const CustomStringConvert().fromJson(json['object_id'])
      ..title = const CustomStringConvert().fromJson(json['title'])
      ..notificationId =
          const CustomStringConvert().fromJson(json['notification_id'])
      ..created = DateTime.parse(json['created'] as String)
      ..avatar = const CustomStringConvert().fromJson(json['avatar'])
      ..group = $enumDecode(_$TypeGroupEnumMap, json['group'])
      ..read = $enumDecode(_$ReadTypeEnumMap, json['read']);

Map<String, dynamic> _$NotificationPayloadDtoToJson(
    NotificationPayloadDto instance) {
  final val = <String, dynamic>{
    'type': _$TypeNotificationEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'object_id', const CustomStringConvert().toJson(instance.objectId));
  writeNotNull('title', const CustomStringConvert().toJson(instance.title));
  writeNotNull('notification_id',
      const CustomStringConvert().toJson(instance.notificationId));
  val['created'] = instance.created.toIso8601String();
  writeNotNull('avatar', const CustomStringConvert().toJson(instance.avatar));
  val['group'] = _$TypeGroupEnumMap[instance.group]!;
  val['read'] = _$ReadTypeEnumMap[instance.read]!;
  return val;
}

const _$TypeNotificationEnumMap = {
  TypeNotification.comment: 'comment',
  TypeNotification.react: 'react',
};

const _$TypeGroupEnumMap = {
  TypeGroup.notification: 0,
  TypeGroup.action: 1,
};

const _$ReadTypeEnumMap = {
  ReadType.unread: 0,
  ReadType.read: 1,
};
