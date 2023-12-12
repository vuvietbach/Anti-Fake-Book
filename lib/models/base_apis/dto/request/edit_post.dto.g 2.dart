// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_post.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPostRequestDto _$EditPostRequestDtoFromJson(Map<String, dynamic> json) =>
    EditPostRequestDto()
      ..id = const CustomStringConvert().fromJson(json['id'])
      ..described = const CustomStringConvert().fromJson(json['described'])
      ..status = const CustomStringConvert().fromJson(json['status'])
      ..image = const CustomUint8ListConverter().fromJson(json['image'])
      ..imageDel = (json['image_del'] as List<dynamic>?)
          ?.map(const CustomStringConvert().fromJson)
          .toList()
      ..imageSort = (json['image_sort'] as List<dynamic>?)
          ?.map(const CustomStringConvert().fromJson)
          .toList()
      ..video = const CustomUint8ListConverter().fromJson(json['video'])
      ..autoAccept = const CustomIntConverter().fromJson(json['auto_accept']);

Map<String, dynamic> _$EditPostRequestDtoToJson(EditPostRequestDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  writeNotNull(
      'described',
      _$JsonConverterToJson<dynamic, String>(
          instance.described, const CustomStringConvert().toJson));
  writeNotNull(
      'status',
      _$JsonConverterToJson<dynamic, String>(
          instance.status, const CustomStringConvert().toJson));
  writeNotNull(
      'image',
      _$JsonConverterToJson<dynamic, Uint8List>(
          instance.image, const CustomUint8ListConverter().toJson));
  writeNotNull('image_del',
      instance.imageDel?.map(const CustomStringConvert().toJson).toList());
  writeNotNull('image_sort',
      instance.imageSort?.map(const CustomStringConvert().toJson).toList());
  writeNotNull(
      'video',
      _$JsonConverterToJson<dynamic, Uint8List>(
          instance.video, const CustomUint8ListConverter().toJson));
  writeNotNull(
      'auto_accept',
      _$JsonConverterToJson<dynamic, int>(
          instance.autoAccept, const CustomIntConverter().toJson));
  return val;
}

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
