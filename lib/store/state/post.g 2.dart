// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostState _$PostStateFromJson(Map<String, dynamic> json) => PostState()
  ..selected = json['selected'] == null
      ? null
      : PostPayloadDTO.fromJson(json['selected'] as Map<String, dynamic>)
  ..listSelections = (json['list_selections'] as List<dynamic>?)
      ?.map((e) => PostPayloadDTO.fromJson(e as Map<String, dynamic>))
      .toList()
  ..totalSelections =
      const CustomIntConverter().fromJson(json['total_selections'])
  ..isPosting = json['is_posting'] as bool;

Map<String, dynamic> _$PostStateToJson(PostState instance) => <String, dynamic>{
      'selected': instance.selected?.toJson(),
      'list_selections':
          instance.listSelections?.map((e) => e.toJson()).toList(),
      'total_selections':
          const CustomIntConverter().toJson(instance.totalSelections),
      'is_posting': instance.isPosting,
    };
