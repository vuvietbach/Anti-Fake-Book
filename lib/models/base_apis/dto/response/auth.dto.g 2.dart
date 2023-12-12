// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      code: const CustomIntConverter().fromJson(json['code']),
      message: const CustomStringConvert().fromJson(json['message']),
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  return val;
}

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      code: const CustomIntConverter().fromJson(json['code']),
      message: const CustomStringConvert().fromJson(json['message']),
      data: SignInResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) {
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

SignInResponseData _$SignInResponseDataFromJson(Map<String, dynamic> json) =>
    SignInResponseData(
      id: const CustomStringConvert().fromJson(json['id']),
      username: const CustomStringConvert().fromJson(json['username']),
      token: const CustomStringConvert().fromJson(json['token']),
      avatar: const CustomStringConvert().fromJson(json['avatar']),
      active: const CustomIntConverter().fromJson(json['active']),
      coins: const CustomIntConverter().fromJson(json['coins']),
    );

Map<String, dynamic> _$SignInResponseDataToJson(SignInResponseData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  writeNotNull(
      'username', const CustomStringConvert().toJson(instance.username));
  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull('avatar', const CustomStringConvert().toJson(instance.avatar));
  writeNotNull('active', const CustomIntConverter().toJson(instance.active));
  writeNotNull('coins', const CustomIntConverter().toJson(instance.coins));
  return val;
}

GetVerifyCodeResponse _$GetVerifyCodeResponseFromJson(
        Map<String, dynamic> json) =>
    GetVerifyCodeResponse(
      code: const CustomIntConverter().fromJson(json['code']),
      message: const CustomStringConvert().fromJson(json['message']),
      codeVerify: const CustomStringConvert().fromJson(json['code_verify']),
    );

Map<String, dynamic> _$GetVerifyCodeResponseToJson(
    GetVerifyCodeResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  writeNotNull(
      'code_verify', const CustomStringConvert().toJson(instance.codeVerify));
  return val;
}

CheckVerifyCodeResponse _$CheckVerifyCodeResponseFromJson(
        Map<String, dynamic> json) =>
    CheckVerifyCodeResponse(
      code: const CustomIntConverter().fromJson(json['code']),
      message: const CustomStringConvert().fromJson(json['message']),
    );

Map<String, dynamic> _$CheckVerifyCodeResponseToJson(
    CheckVerifyCodeResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  return val;
}

LogOutResponse _$LogOutResponseFromJson(Map<String, dynamic> json) =>
    LogOutResponse(
      code: const CustomIntConverter().fromJson(json['code']),
      message: const CustomStringConvert().fromJson(json['message']),
    );

Map<String, dynamic> _$LogOutResponseToJson(LogOutResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  return val;
}
