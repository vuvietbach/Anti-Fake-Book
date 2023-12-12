// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetDevtokenResponse _$SetDevtokenResponseFromJson(Map<String, dynamic> json) =>
    SetDevtokenResponse(
      code: const CustomIntConverter().fromJson(json['code']),
      message: const CustomStringConvert().fromJson(json['message']),
    );

Map<String, dynamic> _$SetDevtokenResponseToJson(SetDevtokenResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  return val;
}
