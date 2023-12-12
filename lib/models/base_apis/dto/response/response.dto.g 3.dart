// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDTO _$ResponseDTOFromJson(Map<String, dynamic> json) => ResponseDTO(
      code: json['code'] as int? ?? ResponseDTO.DEFAULT_CODE,
      message: json['message'] as String? ?? ResponseDTO.DEFAULT_MESSAGE,
    );

Map<String, dynamic> _$ResponseDTOToJson(ResponseDTO instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
