// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_push_settings.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPushSettingRequest _$SetPushSettingRequestFromJson(
        Map<String, dynamic> json) =>
    SetPushSettingRequest()
      ..likeComment = json['like_comment'] as bool
      ..fromFriend = json['from_friend'] as bool
      ..requestedFriend = json['requested_friend'] as bool
      ..suggestedFriend = json['suggested_friend'] as bool
      ..birthday = json['birthday'] as bool
      ..video = json['video'] as bool
      ..report = json['report'] as bool
      ..soundOn = json['sound_on'] as bool
      ..notificationOn = json['notification_on'] as bool
      ..vibrantOn = json['vibrant_on'] as bool
      ..ledOn = json['led_on'] as bool;

Map<String, dynamic> _$SetPushSettingRequestToJson(
        SetPushSettingRequest instance) =>
    <String, dynamic>{
      'like_comment': instance.likeComment,
      'from_friend': instance.fromFriend,
      'requested_friend': instance.requestedFriend,
      'suggested_friend': instance.suggestedFriend,
      'birthday': instance.birthday,
      'video': instance.video,
      'report': instance.report,
      'sound_on': instance.soundOn,
      'notification_on': instance.notificationOn,
      'vibrant_on': instance.vibrantOn,
      'led_on': instance.ledOn,
    };
