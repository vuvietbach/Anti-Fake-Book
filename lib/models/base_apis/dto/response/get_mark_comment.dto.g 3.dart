// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_mark_comment.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMarkCommentResponseDto _$GetMarkCommentResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetMarkCommentResponseDto()
      ..code = const CustomIntConverter().fromJson(json['code'])
      ..message = const CustomStringConvert().fromJson(json['message'])
      ..id = const CustomStringConvert().fromJson(json['id'])
      ..markContent = const CustomStringConvert().fromJson(json['mark_content'])
      ..typeOfMark = const CustomStringConvert().fromJson(json['type_of_mark'])
      ..poster =
          PosterCommentDto.fromJson(json['poster'] as Map<String, dynamic>)
      ..comments = (json['comments'] as List<dynamic>)
          .map((e) => CommentObjectDto.fromJson(e as Map<String, dynamic>))
          .toList()
      ..isBlocked = json['is_blocked'] as bool;

Map<String, dynamic> _$GetMarkCommentResponseDtoToJson(
    GetMarkCommentResponseDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  writeNotNull(
      'mark_content', const CustomStringConvert().toJson(instance.markContent));
  writeNotNull(
      'type_of_mark', const CustomStringConvert().toJson(instance.typeOfMark));
  val['poster'] = instance.poster.toJson();
  val['comments'] = instance.comments.map((e) => e.toJson()).toList();
  val['is_blocked'] = instance.isBlocked;
  return val;
}

PosterCommentDto _$PosterCommentDtoFromJson(Map<String, dynamic> json) =>
    PosterCommentDto()
      ..id = const CustomStringConvert().fromJson(json['id'])
      ..name = const CustomStringConvert().fromJson(json['name'])
      ..avatar = const CustomStringConvert().fromJson(json['avatar']);

Map<String, dynamic> _$PosterCommentDtoToJson(PosterCommentDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  writeNotNull('name', const CustomStringConvert().toJson(instance.name));
  writeNotNull('avatar', const CustomStringConvert().toJson(instance.avatar));
  return val;
}

CommentObjectDto _$CommentObjectDtoFromJson(Map<String, dynamic> json) =>
    CommentObjectDto(
      const CustomStringConvert().fromJson(json['content']),
      PosterCommentDto.fromJson(json['poster'] as Map<String, dynamic>),
      DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$CommentObjectDtoToJson(CommentObjectDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', const CustomStringConvert().toJson(instance.content));
  val['created'] = instance.created.toIso8601String();
  val['poster'] = instance.poster.toJson();
  return val;
}
