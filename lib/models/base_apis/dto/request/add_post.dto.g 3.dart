// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPostRequestDTO _$AddPostRequestDTOFromJson(Map<String, dynamic> json) =>
    AddPostRequestDTO()
      ..image = (json['image'] as List<dynamic>)
          .map(const CustomUint8ListConverter().fromJson)
          .toList()
      ..video = (json['video'] as List<dynamic>)
          .map(const CustomUint8ListConverter().fromJson)
          .toList()
      ..described = const CustomStringConvert().fromJson(json['described'])
      ..status = const CustomStringConvert().fromJson(json['status']);

Map<String, dynamic> _$AddPostRequestDTOToJson(AddPostRequestDTO instance) {
  final val = <String, dynamic>{
    'image':
        instance.image.map(const CustomUint8ListConverter().toJson).toList(),
    'video':
        instance.video.map(const CustomUint8ListConverter().toJson).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'described', const CustomStringConvert().toJson(instance.described));
  writeNotNull('status', const CustomStringConvert().toJson(instance.status));
  return val;
}
