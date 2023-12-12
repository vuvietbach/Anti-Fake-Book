// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) =>
    SignInRequest(
      email: const CustomStringConvert().fromJson(json['email']),
      password: const CustomStringConvert().fromJson(json['password']),
    );

Map<String, dynamic> _$SignInRequestToJson(SignInRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', const CustomStringConvert().toJson(instance.email));
  writeNotNull(
      'password', const CustomStringConvert().toJson(instance.password));
  return val;
}

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      email: const CustomStringConvert().fromJson(json['email']),
      password: const CustomStringConvert().fromJson(json['password']),
      uuid: const CustomStringConvert().fromJson(json['uuid']),
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', const CustomStringConvert().toJson(instance.email));
  writeNotNull(
      'password', const CustomStringConvert().toJson(instance.password));
  writeNotNull('uuid', const CustomStringConvert().toJson(instance.uuid));
  return val;
}

LogOutRequest _$LogOutRequestFromJson(Map<String, dynamic> json) =>
    LogOutRequest(
      token: const CustomStringConvert().fromJson(json['token']),
    );

Map<String, dynamic> _$LogOutRequestToJson(LogOutRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  return val;
}

GetVerifyCodeRequest _$GetVerifyCodeRequestFromJson(
        Map<String, dynamic> json) =>
    GetVerifyCodeRequest(
      email: const CustomStringConvert().fromJson(json['email']),
    );

Map<String, dynamic> _$GetVerifyCodeRequestToJson(
    GetVerifyCodeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', const CustomStringConvert().toJson(instance.email));
  return val;
}

CheckVerifyCodeRequest _$CheckVerifyCodeRequestFromJson(
        Map<String, dynamic> json) =>
    CheckVerifyCodeRequest(
      email: const CustomStringConvert().fromJson(json['email']),
      codeVerify: const CustomStringConvert().fromJson(json['code_verify']),
    );

Map<String, dynamic> _$CheckVerifyCodeRequestToJson(
    CheckVerifyCodeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', const CustomStringConvert().toJson(instance.email));
  writeNotNull(
      'code_verify', const CustomStringConvert().toJson(instance.codeVerify));
  return val;
}
