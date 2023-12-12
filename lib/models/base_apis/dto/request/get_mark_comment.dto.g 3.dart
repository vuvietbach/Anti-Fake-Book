// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_mark_comment.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMarkCommentRequestDto _$GetMarkCommentRequestDtoFromJson(
        Map<String, dynamic> json) =>
    GetMarkCommentRequestDto(
      const CustomStringConvert().fromJson(json['id']),
      const CustomIntConverter().fromJson(json['index']),
      const CustomIntConverter().fromJson(json['count']),
    );

Map<String, dynamic> _$GetMarkCommentRequestDtoToJson(
    GetMarkCommentRequestDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  writeNotNull('index', const CustomIntConverter().toJson(instance.index));
  writeNotNull('count', const CustomIntConverter().toJson(instance.count));
  return val;
}
