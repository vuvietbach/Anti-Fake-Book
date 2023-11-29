import 'package:anti_fake_book/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.dto.g.dart';

@customJsonSerializable
class SignUpResponse {
  final int code;
  final String message;
  SignUpResponse(
      {required this.code, required this.message});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}

@customJsonSerializable
class SignInResponse {
  final int code;
  final String message;
  final SignInResponseData data;
  SignInResponse(
      {required this.code, required this.message, required this.data});

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}

@customJsonSerializable
class SignInResponseData {
  final String id;
  final String username;
  final String token;
  final String avatar;
  final int active;
  final int coins;

  SignInResponseData({required this.id, required this.username, required this.token, required this.avatar, required this.active, required this.coins});
  
  factory SignInResponseData.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$SignInResponseDataToJson(this);
}


@customJsonSerializable
class GetVerifyCodeResponse {
  final int code;
  final String message;
  @JsonKey(name: "code_verify")
  final String codeVerify;
  GetVerifyCodeResponse(
      {required this.code, required this.message, required this.codeVerify});

  factory GetVerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVerifyCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVerifyCodeResponseToJson(this);
}

@customJsonSerializable
class CheckVerifyCodeResponse {
  final int code;
  final String message;
  CheckVerifyCodeResponse(
      {required this.code, required this.message});

  factory CheckVerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckVerifyCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckVerifyCodeResponseToJson(this);
}

@customJsonSerializable
class LogOutResponse {
  final int code;
  final String message;
  LogOutResponse(
      {required this.code, required this.message});

  factory LogOutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogOutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogOutResponseToJson(this);
}