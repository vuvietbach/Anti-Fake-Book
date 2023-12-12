// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feel_post.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeelPostResponseDto _$FeelPostResponseDtoFromJson(Map<String, dynamic> json) =>
    FeelPostResponseDto()
      ..code = const CustomIntConverter().fromJson(json['code'])
      ..message = const CustomStringConvert().fromJson(json['message'])
      ..data = FeelPostDataDto.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$FeelPostResponseDtoToJson(FeelPostResponseDto instance) {
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

FeelPostDataDto _$FeelPostDataDtoFromJson(Map<String, dynamic> json) =>
    FeelPostDataDto()
      ..disapointed = const CustomIntConverter().fromJson(json['disapointed'])
      ..kudos = const CustomIntConverter().fromJson(json['kudos']);

Map<String, dynamic> _$FeelPostDataDtoToJson(FeelPostDataDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'disapointed', const CustomIntConverter().toJson(instance.disapointed));
  writeNotNull('kudos', const CustomIntConverter().toJson(instance.kudos));
  return val;
}
