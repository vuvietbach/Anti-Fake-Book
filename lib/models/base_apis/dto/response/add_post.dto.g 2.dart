// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPostResponseDTO _$AddPostResponseDTOFromJson(Map<String, dynamic> json) =>
    AddPostResponseDTO(
      DataAddPostResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int
      ..message = const CustomStringConvert().fromJson(json['message']);

Map<String, dynamic> _$AddPostResponseDTOToJson(AddPostResponseDTO instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': const CustomStringConvert().toJson(instance.message),
      'data': instance.data.toJson(),
    };

DataAddPostResponse _$DataAddPostResponseFromJson(Map<String, dynamic> json) =>
    DataAddPostResponse(
      const CustomStringConvert().fromJson(json['id']),
      const CustomStringConvert().fromJson(json['url']),
      json['coins'] as int,
    );

Map<String, dynamic> _$DataAddPostResponseToJson(
        DataAddPostResponse instance) =>
    <String, dynamic>{
      'id': const CustomStringConvert().toJson(instance.id),
      'url': const CustomStringConvert().toJson(instance.url),
      'coins': instance.coins,
    };
