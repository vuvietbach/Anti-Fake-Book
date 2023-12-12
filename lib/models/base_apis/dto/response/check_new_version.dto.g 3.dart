// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_new_version.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckNewVersionReponseDto _$CheckNewVersionReponseDtoFromJson(
        Map<String, dynamic> json) =>
    CheckNewVersionReponseDto()
      ..data = CheckNewVersionDataReponseDto.fromJson(
          json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$CheckNewVersionReponseDtoToJson(
        CheckNewVersionReponseDto instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

CheckNewVersionDataReponseDto _$CheckNewVersionDataReponseDtoFromJson(
        Map<String, dynamic> json) =>
    CheckNewVersionDataReponseDto()
      ..versionInfo =
          _VersionInfo.fromJson(json['version_info'] as Map<String, dynamic>)
      ..userInfo = _UserInfo.fromJson(json['user_info'] as Map<String, dynamic>)
      ..badget = const CustomIntConverter().fromJson(json['badget'])
      ..unreadMessage =
          const CustomIntConverter().fromJson(json['unread_message'])
      ..now = DateTime.parse(json['now'] as String);

Map<String, dynamic> _$CheckNewVersionDataReponseDtoToJson(
    CheckNewVersionDataReponseDto instance) {
  final val = <String, dynamic>{
    'version_info': instance.versionInfo.toJson(),
    'user_info': instance.userInfo.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('badget', const CustomIntConverter().toJson(instance.badget));
  writeNotNull('unread_message',
      const CustomIntConverter().toJson(instance.unreadMessage));
  val['now'] = instance.now.toIso8601String();
  return val;
}

_VersionInfo _$VersionInfoFromJson(Map<String, dynamic> json) => _VersionInfo()
  ..version = const CustomStringConvert().fromJson(json['version'])
  ..url = const CustomStringConvert().fromJson(json['url'])
  ..require = json['require'] as bool;

Map<String, dynamic> _$VersionInfoToJson(_VersionInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', const CustomStringConvert().toJson(instance.version));
  writeNotNull('url', const CustomStringConvert().toJson(instance.url));
  val['require'] = instance.require;
  return val;
}

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo()
  ..id = const CustomStringConvert().fromJson(json['id'])
  ..active = json['active'] as bool;

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  val['active'] = instance.active;
  return val;
}
