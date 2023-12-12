// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetUserInfoRequest _$SetUserInfoRequestFromJson(Map<String, dynamic> json) =>
    SetUserInfoRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      username: const CustomStringConvert().fromJson(json['username']),
      description: const CustomStringConvert().fromJson(json['description']),
      avatar: const CustomStringConvert().fromJson(json['avatar']),
      address: const CustomStringConvert().fromJson(json['address']),
      city: const CustomStringConvert().fromJson(json['city']),
      country: const CustomStringConvert().fromJson(json['country']),
      coverImage: const CustomStringConvert().fromJson(json['cover_image']),
      link: const CustomStringConvert().fromJson(json['link']),
    );

Map<String, dynamic> _$SetUserInfoRequestToJson(SetUserInfoRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull(
      'username',
      _$JsonConverterToJson<dynamic, String>(
          instance.username, const CustomStringConvert().toJson));
  writeNotNull(
      'description',
      _$JsonConverterToJson<dynamic, String>(
          instance.description, const CustomStringConvert().toJson));
  writeNotNull(
      'avatar',
      _$JsonConverterToJson<dynamic, String>(
          instance.avatar, const CustomStringConvert().toJson));
  writeNotNull(
      'address',
      _$JsonConverterToJson<dynamic, String>(
          instance.address, const CustomStringConvert().toJson));
  writeNotNull(
      'city',
      _$JsonConverterToJson<dynamic, String>(
          instance.city, const CustomStringConvert().toJson));
  writeNotNull(
      'country',
      _$JsonConverterToJson<dynamic, String>(
          instance.country, const CustomStringConvert().toJson));
  writeNotNull(
      'cover_image',
      _$JsonConverterToJson<dynamic, String>(
          instance.coverImage, const CustomStringConvert().toJson));
  writeNotNull(
      'link',
      _$JsonConverterToJson<dynamic, String>(
          instance.link, const CustomStringConvert().toJson));
  return val;
}

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

GetUserInfoRequest _$GetUserInfoRequestFromJson(Map<String, dynamic> json) =>
    GetUserInfoRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      userId: const CustomIntConverter().fromJson(json['user_id']),
    );

Map<String, dynamic> _$GetUserInfoRequestToJson(GetUserInfoRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'token',
      _$JsonConverterToJson<dynamic, String>(
          instance.token, const CustomStringConvert().toJson));
  writeNotNull(
      'user_id',
      _$JsonConverterToJson<dynamic, int>(
          instance.userId, const CustomIntConverter().toJson));
  return val;
}
