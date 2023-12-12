// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modified_post.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModifiedPostResponseDto _$ModifiedPostResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ModifiedPostResponseDto(
      DataModifiedPostResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = const CustomIntConverter().fromJson(json['code'])
      ..message = const CustomStringConvert().fromJson(json['message']);

Map<String, dynamic> _$ModifiedPostResponseDtoToJson(
    ModifiedPostResponseDto instance) {
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

DataModifiedPostResponse _$DataModifiedPostResponseFromJson(
        Map<String, dynamic> json) =>
    DataModifiedPostResponse(
      const CustomIntConverter().fromJson(json['coins']),
    );

Map<String, dynamic> _$DataModifiedPostResponseToJson(
    DataModifiedPostResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('coins', const CustomIntConverter().toJson(instance.coins));
  return val;
}
