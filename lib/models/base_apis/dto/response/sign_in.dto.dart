import 'package:json_annotation/json_annotation.dart';

part 'sign_in.dto.g.dart';

@JsonSerializable()
class SignInResponse {
  final int code;
  final String message;
  final Map<String, dynamic> data;
  SignInResponse(
      {required this.code, required this.message, required this.data});

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
