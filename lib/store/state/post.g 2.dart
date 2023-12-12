// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostStateImpl _$$PostStateImplFromJson(Map<String, dynamic> json) =>
    _$PostStateImpl(
      selected: json['selected'] == null
          ? const PostPayloadDTO()
          : PostPayloadDTO.fromJson(json['selected'] as Map<String, dynamic>),
      listSelections: (json['listSelections'] as List<dynamic>?)
              ?.map((e) => PostPayloadDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalSelections: json['totalSelections'] as int? ?? 0,
      isPosting: json['isPosting'] as bool? ?? false,
    );

Map<String, dynamic> _$$PostStateImplToJson(_$PostStateImpl instance) =>
    <String, dynamic>{
      'selected': instance.selected,
      'listSelections': instance.listSelections,
      'totalSelections': instance.totalSelections,
      'isPosting': instance.isPosting,
    };
