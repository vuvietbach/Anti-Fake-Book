// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_post.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportPostRequestDto _$ReportPostRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ReportPostRequestDto(
      id: const CustomStringConvert().fromJson(json['id']),
      subject: (json['subject'] as List<dynamic>)
          .map(const CustomStringConvert().fromJson)
          .toList(),
      details: const CustomStringConvert().fromJson(json['details']),
    );

Map<String, dynamic> _$ReportPostRequestDtoToJson(
    ReportPostRequestDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  val['subject'] =
      instance.subject.map(const CustomStringConvert().toJson).toList();
  writeNotNull('details', const CustomStringConvert().toJson(instance.details));
  return val;
}
