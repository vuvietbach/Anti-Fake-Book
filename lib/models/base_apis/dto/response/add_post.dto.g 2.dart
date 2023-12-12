// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPostResponseDTO _$AddPostResponseDTOFromJson(Map<String, dynamic> json) =>
    AddPostResponseDTO(
      DataAddPostResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = const CustomIntConverter().fromJson(json['code'])
      ..message = const CustomStringConvert().fromJson(json['message']);

Map<String, dynamic> _$AddPostResponseDTOToJson(AddPostResponseDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  val['data'] = instance.data.toJson();
  return val;
}

DataAddPostResponse _$DataAddPostResponseFromJson(Map<String, dynamic> json) =>
    DataAddPostResponse(
      const CustomStringConvert().fromJson(json['id']),
      const CustomStringConvert().fromJson(json['url']),
      const CustomIntConverter().fromJson(json['coins']),
    );

Map<String, dynamic> _$DataAddPostResponseToJson(DataAddPostResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  writeNotNull('url', const CustomStringConvert().toJson(instance.url));
  writeNotNull('coins', const CustomIntConverter().toJson(instance.coins));
  return val;
}
