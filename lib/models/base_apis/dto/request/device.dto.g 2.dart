// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetDevtokenRequest _$SetDevtokenRequestFromJson(Map<String, dynamic> json) =>
    SetDevtokenRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      devtype: const CustomStringConvert().fromJson(json['devtype']),
      devtoken: const CustomStringConvert().fromJson(json['devtoken']),
    );

Map<String, dynamic> _$SetDevtokenRequestToJson(SetDevtokenRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull('devtype', const CustomStringConvert().toJson(instance.devtype));
  writeNotNull(
      'devtoken', const CustomStringConvert().toJson(instance.devtoken));
  return val;
}
