// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_info.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserInfoResponseDTO _$GetUserInfoResponseDTOFromJson(
        Map<String, dynamic> json) =>
    GetUserInfoResponseDTO(
      UserInfoDTO.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = const CustomIntConverter().fromJson(json['code'])
      ..message = const CustomStringConvert().fromJson(json['message']);

Map<String, dynamic> _$GetUserInfoResponseDTOToJson(
    GetUserInfoResponseDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  val['data'] = instance.data.toJson();
  return val;
}

UserInfoDTO _$UserInfoDTOFromJson(Map<String, dynamic> json) => UserInfoDTO(
      id: const CustomStringConvert().fromJson(json['id']),
      username: const CustomStringConvert().fromJson(json['username']),
    )
      ..created = json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String)
      ..description = const CustomStringConvert().fromJson(json['description'])
      ..avatar = const CustomStringConvert().fromJson(json['avatar'])
      ..coverImage = const CustomStringConvert().fromJson(json['cover_image'])
      ..link = const CustomStringConvert().fromJson(json['link'])
      ..address = const CustomStringConvert().fromJson(json['address'])
      ..city = const CustomStringConvert().fromJson(json['city'])
      ..country = const CustomStringConvert().fromJson(json['country'])
      ..listing = const CustomIntConverter().fromJson(json['listing'])
      ..isFriend = const CustomBoolConverter().fromJson(json['is_friend'])
      ..online = const CustomBoolConverter().fromJson(json['online'])
      ..coins = const CustomIntConverter().fromJson(json['coins']);

Map<String, dynamic> _$UserInfoDTOToJson(UserInfoDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  writeNotNull(
      'username', const CustomStringConvert().toJson(instance.username));
  writeNotNull('created', instance.created?.toIso8601String());
  writeNotNull(
      'description',
      _$JsonConverterToJson<dynamic, String>(
          instance.description, const CustomStringConvert().toJson));
  writeNotNull(
      'avatar',
      _$JsonConverterToJson<dynamic, String>(
          instance.avatar, const CustomStringConvert().toJson));
  writeNotNull(
      'cover_image',
      _$JsonConverterToJson<dynamic, String>(
          instance.coverImage, const CustomStringConvert().toJson));
  writeNotNull(
      'link',
      _$JsonConverterToJson<dynamic, String>(
          instance.link, const CustomStringConvert().toJson));
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
      'listing',
      _$JsonConverterToJson<dynamic, int>(
          instance.listing, const CustomIntConverter().toJson));
  writeNotNull(
      'is_friend', const CustomBoolConverter().toJson(instance.isFriend));
  writeNotNull('online', const CustomBoolConverter().toJson(instance.online));
  writeNotNull(
      'coins',
      _$JsonConverterToJson<dynamic, int>(
          instance.coins, const CustomIntConverter().toJson));
  return val;
}

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
