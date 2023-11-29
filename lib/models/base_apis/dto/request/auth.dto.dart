import 'package:anti_fake_book/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.dto.g.dart';

@customJsonSerializable
class SignInRequest {
  final String email;
  final String password;
  SignInRequest({required this.email, required this.password});
  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}

@customJsonSerializable
class SignUpRequest {
  final String email;
  final String password;
  final String uuid;
  SignUpRequest(
      {required this.email, required this.password, required this.uuid});
  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}

@customJsonSerializable
class LogOutRequest {
  final String token;
  LogOutRequest({required this.token});
  factory LogOutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogOutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LogOutRequestToJson(this);
}

@customJsonSerializable
class GetVerifyCodeRequest {
  final String email;
  GetVerifyCodeRequest({required this.email});
  factory GetVerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$GetVerifyCodeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetVerifyCodeRequestToJson(this);
}

@customJsonSerializable
class CheckVerifyCodeRequest {
  final String email;

  @JsonKey(name: "code_verify")
  final String codeVerify;

  CheckVerifyCodeRequest({required this.email, required this.codeVerify});

  factory CheckVerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckVerifyCodeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CheckVerifyCodeRequestToJson(this);
}
