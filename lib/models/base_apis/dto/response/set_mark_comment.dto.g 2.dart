// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_mark_comment.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetMarkCommentReponseDto _$SetMarkCommentReponseDtoFromJson(
        Map<String, dynamic> json) =>
    SetMarkCommentReponseDto()
      ..code = const CustomIntConverter().fromJson(json['code'])
      ..message = const CustomStringConvert().fromJson(json['message'])
      ..data =
          SetMarkCommentDataDto.fromJson(json['data'] as Map<String, dynamic>)
      ..coins = const CustomIntConverter().fromJson(json['coins']);

Map<String, dynamic> _$SetMarkCommentReponseDtoToJson(
    SetMarkCommentReponseDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  val['data'] = instance.data.toJson();
  writeNotNull('coins', const CustomIntConverter().toJson(instance.coins));
  return val;
}

SetMarkCommentDataDto _$SetMarkCommentDataDtoFromJson(
        Map<String, dynamic> json) =>
    SetMarkCommentDataDto()
      ..id = const CustomStringConvert().fromJson(json['id'])
      ..markContent = const CustomStringConvert().fromJson(json['mark_content'])
      ..poster =
          PosterCommentDto.fromJson(json['poster'] as Map<String, dynamic>)
      ..comments = (json['comments'] as List<dynamic>)
          .map((e) => CommentObjectDto.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SetMarkCommentDataDtoToJson(
    SetMarkCommentDataDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  writeNotNull(
      'mark_content', const CustomStringConvert().toJson(instance.markContent));
  val['poster'] = instance.poster.toJson();
  val['comments'] = instance.comments.map((e) => e.toJson()).toList();
  return val;
}
