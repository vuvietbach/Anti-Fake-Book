import 'dart:convert';

import 'package:anti_fake_book/utils.dart';
import 'package:json_annotation/json_annotation.dart';
part 'report_post.dto.g.dart';

String listToString(List<String> value) {
  return value.join(',');
}

@customJsonSerializable
class ReportPostRequestDto {
  final String id;
  //convert to string
  @JsonKey(toJson: listToString)
  final List<String> subject;
  final String details;
  ReportPostRequestDto(
      {required this.id, required this.subject, required this.details});
  factory ReportPostRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ReportPostRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReportPostRequestDtoToJson(this);
}
