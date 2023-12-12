// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_mark_comment.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetMarkCommentRequest _$SetMarkCommentRequestFromJson(
        Map<String, dynamic> json) =>
    SetMarkCommentRequest()
      ..id = const CustomStringConvert().fromJson(json['id'])
      ..content = const CustomStringConvert().fromJson(json['content'])
      ..index = const CustomIntConverter().fromJson(json['index'])
      ..count = const CustomIntConverter().fromJson(json['count'])
      ..markId = const CustomStringConvert().fromJson(json['mark_id'])
      ..type = const CustomIntConverter().fromJson(json['type']);

Map<String, dynamic> _$SetMarkCommentRequestToJson(
    SetMarkCommentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  writeNotNull('content', const CustomStringConvert().toJson(instance.content));
  writeNotNull('index', const CustomIntConverter().toJson(instance.index));
  writeNotNull('count', const CustomIntConverter().toJson(instance.count));
  writeNotNull('mark_id', const CustomStringConvert().toJson(instance.markId));
  writeNotNull('type', const CustomIntConverter().toJson(instance.type));
  return val;
}
