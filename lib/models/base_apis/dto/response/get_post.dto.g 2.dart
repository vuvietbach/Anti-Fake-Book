// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostResponseDTO _$GetPostResponseDTOFromJson(Map<String, dynamic> json) =>
    GetPostResponseDTO(
      PostPayloadDTO.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int
      ..message = const CustomStringConvert().fromJson(json['message']);

Map<String, dynamic> _$GetPostResponseDTOToJson(GetPostResponseDTO instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': const CustomStringConvert().toJson(instance.message),
      'data': instance.data.toJson(),
    };

PostPayloadDTO _$PostPayloadDTOFromJson(Map<String, dynamic> json) =>
    PostPayloadDTO(
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImagePayloadDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      video: (json['video'] as List<dynamic>?)
              ?.map((e) => VideoPayloadDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    )
      ..id = const CustomStringConvert().fromJson(json['id'])
      ..name = const CustomStringConvert().fromJson(json['name'])
      ..created = json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String)
      ..modified = json['modified'] == null
          ? null
          : DateTime.parse(json['modified'] as String)
      ..fake = const CustomIntConverter().fromJson(json['fake'])
      ..trust = const CustomIntConverter().fromJson(json['trust'])
      ..kudos = const CustomIntConverter().fromJson(json['kudos'])
      ..disappointed = const CustomIntConverter().fromJson(json['disappointed'])
      ..isRated = const CustomBoolConverter().fromJson(json['is_rated'])
      ..isMarked = const CustomBoolConverter().fromJson(json['is_marked'])
      ..author = json['author'] == null
          ? null
          : AuthorPostPayloadDTO.fromJson(
              json['author'] as Map<String, dynamic>)
      ..category = json['category'] == null
          ? null
          : PostCategory.fromJson(json['category'] as Map<String, dynamic>)
      ..state = const CustomIntConverter().fromJson(json['state'])
      ..isBlock = const CustomBoolConverter().fromJson(json['is_block'])
      ..canEdit = const CustomBoolConverter().fromJson(json['can_edit'])
      ..banned = const CustomBoolConverter().fromJson(json['banned'])
      ..canMark = const CustomIntConverter().fromJson(json['can_mark'])
      ..canRate = const CustomIntConverter().fromJson(json['can_rate'])
      ..url = const CustomStringConvert().fromJson(json['url'])
      ..messages = const CustomStringConvert().fromJson(json['messages']);

Map<String, dynamic> _$PostPayloadDTOToJson(PostPayloadDTO instance) =>
    <String, dynamic>{
      'id': _$JsonConverterToJson<dynamic, String>(
          instance.id, const CustomStringConvert().toJson),
      'name': _$JsonConverterToJson<dynamic, String>(
          instance.name, const CustomStringConvert().toJson),
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'fake': const CustomIntConverter().toJson(instance.fake),
      'trust': const CustomIntConverter().toJson(instance.trust),
      'kudos': const CustomIntConverter().toJson(instance.kudos),
      'disappointed': const CustomIntConverter().toJson(instance.disappointed),
      'is_rated': const CustomBoolConverter().toJson(instance.isRated),
      'is_marked': const CustomBoolConverter().toJson(instance.isMarked),
      'images': instance.images.map((e) => e.toJson()).toList(),
      'video': instance.video.map((e) => e.toJson()).toList(),
      'author': instance.author?.toJson(),
      'category': instance.category?.toJson(),
      'state': const CustomIntConverter().toJson(instance.state),
      'is_block': const CustomBoolConverter().toJson(instance.isBlock),
      'can_edit': const CustomBoolConverter().toJson(instance.canEdit),
      'banned': const CustomBoolConverter().toJson(instance.banned),
      'can_mark': const CustomIntConverter().toJson(instance.canMark),
      'can_rate': const CustomIntConverter().toJson(instance.canRate),
      'url': _$JsonConverterToJson<dynamic, String>(
          instance.url, const CustomStringConvert().toJson),
      'messages': _$JsonConverterToJson<dynamic, String>(
          instance.messages, const CustomStringConvert().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

PostCategory _$PostCategoryFromJson(Map<String, dynamic> json) => PostCategory(
      const CustomStringConvert().fromJson(json['id']),
      const CustomStringConvert().fromJson(json['name']),
      const CustomStringConvert().fromJson(json['has_name']),
    );

Map<String, dynamic> _$PostCategoryToJson(PostCategory instance) =>
    <String, dynamic>{
      'id': _$JsonConverterToJson<dynamic, String>(
          instance.id, const CustomStringConvert().toJson),
      'name': _$JsonConverterToJson<dynamic, String>(
          instance.name, const CustomStringConvert().toJson),
      'has_name': _$JsonConverterToJson<dynamic, String>(
          instance.hasName, const CustomStringConvert().toJson),
    };

AuthorPostPayloadDTO _$AuthorPostPayloadDTOFromJson(
        Map<String, dynamic> json) =>
    AuthorPostPayloadDTO(
      (json['listing'] as List<dynamic>)
          .map(const CustomStringConvert().fromJson)
          .toList(),
      const CustomStringConvert().fromJson(json['id']),
      const CustomStringConvert().fromJson(json['name']),
      json['coins'] as int,
    )..avatar = const CustomStringConvert().fromJson(json['avatar']);

Map<String, dynamic> _$AuthorPostPayloadDTOToJson(
        AuthorPostPayloadDTO instance) =>
    <String, dynamic>{
      'id': const CustomStringConvert().toJson(instance.id),
      'name': const CustomStringConvert().toJson(instance.name),
      'avatar': _$JsonConverterToJson<dynamic, String>(
          instance.avatar, const CustomStringConvert().toJson),
      'coins': instance.coins,
      'listing':
          instance.listing.map(const CustomStringConvert().toJson).toList(),
    };

ImagePayloadDTO _$ImagePayloadDTOFromJson(Map<String, dynamic> json) =>
    ImagePayloadDTO(
      const CustomStringConvert().fromJson(json['url']),
      const CustomStringConvert().fromJson(json['id']),
    );

Map<String, dynamic> _$ImagePayloadDTOToJson(ImagePayloadDTO instance) =>
    <String, dynamic>{
      'id': const CustomStringConvert().toJson(instance.id),
      'url': const CustomStringConvert().toJson(instance.url),
    };

VideoPayloadDTO _$VideoPayloadDTOFromJson(Map<String, dynamic> json) =>
    VideoPayloadDTO(
      const CustomStringConvert().fromJson(json['url']),
      const CustomStringConvert().fromJson(json['id']),
      const CustomStringConvert().fromJson(json['thumb']),
    );

Map<String, dynamic> _$VideoPayloadDTOToJson(VideoPayloadDTO instance) =>
    <String, dynamic>{
      'id': const CustomStringConvert().toJson(instance.id),
      'url': const CustomStringConvert().toJson(instance.url),
      'thumb': const CustomStringConvert().toJson(instance.thumb),
    };
