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
      ..code = json['code'] as int
      ..message = const CustomStringConvert().fromJson(json['message']);

Map<String, dynamic> _$GetUserInfoResponseDTOToJson(
        GetUserInfoResponseDTO instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': const CustomStringConvert().toJson(instance.message),
      'data': instance.data.toJson(),
    };

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

Map<String, dynamic> _$UserInfoDTOToJson(UserInfoDTO instance) =>
    <String, dynamic>{
      'id': const CustomStringConvert().toJson(instance.id),
      'username': const CustomStringConvert().toJson(instance.username),
      'created': instance.created?.toIso8601String(),
      'description': _$JsonConverterToJson<dynamic, String>(
          instance.description, const CustomStringConvert().toJson),
      'avatar': _$JsonConverterToJson<dynamic, String>(
          instance.avatar, const CustomStringConvert().toJson),
      'cover_image': _$JsonConverterToJson<dynamic, String>(
          instance.coverImage, const CustomStringConvert().toJson),
      'link': _$JsonConverterToJson<dynamic, String>(
          instance.link, const CustomStringConvert().toJson),
      'address': _$JsonConverterToJson<dynamic, String>(
          instance.address, const CustomStringConvert().toJson),
      'city': _$JsonConverterToJson<dynamic, String>(
          instance.city, const CustomStringConvert().toJson),
      'country': _$JsonConverterToJson<dynamic, String>(
          instance.country, const CustomStringConvert().toJson),
      'listing': const CustomIntConverter().toJson(instance.listing),
      'is_friend': const CustomBoolConverter().toJson(instance.isFriend),
      'online': const CustomBoolConverter().toJson(instance.online),
      'coins': const CustomIntConverter().toJson(instance.coins),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
