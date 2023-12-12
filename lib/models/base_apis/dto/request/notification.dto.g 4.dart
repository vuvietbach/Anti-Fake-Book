// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotificationRequest _$GetNotificationRequestFromJson(
        Map<String, dynamic> json) =>
    GetNotificationRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      index: const CustomIntConverter().fromJson(json['index']),
      count: const CustomIntConverter().fromJson(json['count']),
    );

Map<String, dynamic> _$GetNotificationRequestToJson(
    GetNotificationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull('index', const CustomIntConverter().toJson(instance.index));
  writeNotNull('count', const CustomIntConverter().toJson(instance.count));
  return val;
}

SetReadNotificationRequest _$SetReadNotificationRequestFromJson(
        Map<String, dynamic> json) =>
    SetReadNotificationRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      notificationId:
          const CustomStringConvert().fromJson(json['notification_id']),
    );

Map<String, dynamic> _$SetReadNotificationRequestToJson(
    SetReadNotificationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull('notification_id',
      const CustomStringConvert().toJson(instance.notificationId));
  return val;
}

SetDevTokenRequest _$SetDevTokenRequestFromJson(Map<String, dynamic> json) =>
    SetDevTokenRequest(
      const CustomStringConvert().fromJson(json['devtype']),
      token: const CustomStringConvert().fromJson(json['token']),
      devtoken: const CustomStringConvert().fromJson(json['devtoken']),
    );

Map<String, dynamic> _$SetDevTokenRequestToJson(SetDevTokenRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull(
      'devtoken', const CustomStringConvert().toJson(instance.devtoken));
  writeNotNull('devtype', const CustomStringConvert().toJson(instance.devtype));
  return val;
}
