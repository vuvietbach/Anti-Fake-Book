import 'package:json_annotation/json_annotation.dart';

part "response.dto.g.dart";

@JsonSerializable()
class ResponseDTO {
  static const int DEFAULT_CODE = 0;
  static const String DEFAULT_MESSAGE = "";
  int code;
  String message;
  ResponseDTO({this.code = ResponseDTO.DEFAULT_CODE, this.message = ResponseDTO.DEFAULT_MESSAGE});
  factory ResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDTOToJson(this);
}
