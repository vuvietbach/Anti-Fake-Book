import 'package:anti_fake_book/utils.dart';

part 'auth.dto.g.dart';

@customJsonSerializable
class SignUpResponse {
  final int code;
  final String message;
  final SignUpResponseData data;

  SignUpResponse(
      {required this.code, required this.message, required this.data});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}

@customJsonSerializable
class SignUpResponseData {
  final String verifyCode;

  SignUpResponseData({required this.verifyCode});

  factory SignUpResponseData.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseDataToJson(this);
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

  SignInResponseData(
      {required this.id,
      required this.username,
      required this.token,
      required this.avatar,
      required this.active,
      required this.coins});

  factory SignInResponseData.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$SignInResponseDataToJson(this);
}

@customJsonSerializable
class GetVerifyCodeResponse {
  final int code;
  final String message;
  final GetVerifyCodeResponseData data;

  GetVerifyCodeResponse(
      {required this.code, required this.message, required this.data});

  factory GetVerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVerifyCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVerifyCodeResponseToJson(this);
}

@customJsonSerializable
class GetVerifyCodeResponseData {
  final String verifyCode;
  GetVerifyCodeResponseData({required this.verifyCode});

  factory GetVerifyCodeResponseData.fromJson(Map<String, dynamic> json) =>
      _$GetVerifyCodeResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetVerifyCodeResponseDataToJson(this);
}

@customJsonSerializable
class CheckVerifyCodeResponse {
  final int code;
  final String message;
  final CheckVerifyCodeResponseData data;
  CheckVerifyCodeResponse(
      {required this.code, required this.message, required this.data});

  factory CheckVerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckVerifyCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckVerifyCodeResponseToJson(this);
}

@customJsonSerializable
class CheckVerifyCodeResponseData {
  final String id;
  final int active;
  CheckVerifyCodeResponseData({required this.id, required this.active});

  factory CheckVerifyCodeResponseData.fromJson(Map<String, dynamic> json) =>
      _$CheckVerifyCodeResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckVerifyCodeResponseDataToJson(this);
}

@customJsonSerializable
class LogOutResponse {
  final int code;
  final String message;
  LogOutResponse({required this.code, required this.message});

  factory LogOutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogOutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogOutResponseToJson(this);
}

@customJsonSerializable
class ChangeProfileAfterSignUpResponse {
  final int code;
  final String message;
  final ChangeProfileAfterSignUpResponseData data;
  ChangeProfileAfterSignUpResponse(
      {required this.code, required this.message, required this.data});

  factory ChangeProfileAfterSignUpResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ChangeProfileAfterSignUpResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ChangeProfileAfterSignUpResponseToJson(this);
}

@customJsonSerializable
class ChangeProfileAfterSignUpResponseData {
  final String id;
  final String username;
  final String email;
  final String created;
  final String avatar;

  ChangeProfileAfterSignUpResponseData(
      {required this.id,
      required this.username,
      required this.avatar,
      required this.email,
      required this.created});

  factory ChangeProfileAfterSignUpResponseData.fromJson(
          Map<String, dynamic> json) =>
      _$ChangeProfileAfterSignUpResponseDataFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ChangeProfileAfterSignUpResponseDataToJson(this);
}
