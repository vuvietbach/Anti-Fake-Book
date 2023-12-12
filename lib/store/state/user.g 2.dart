// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStateImpl _$$UserStateImplFromJson(Map<String, dynamic> json) =>
    _$UserStateImpl(
      email: json['email'] == null
          ? ""
          : const CustomStringConvert().fromJson(json['email']),
      token: json['token'] == null
          ? ""
          : const CustomStringConvert().fromJson(json['token']),
      username: json['username'] == null
          ? ""
          : const CustomStringConvert().fromJson(json['username']),
      avatar: json['avatar'] == null
          ? ""
          : const CustomStringConvert().fromJson(json['avatar']),
      userInfo: json['user_info'] == null
          ? _defaultUserInfoData
          : UserInfoData.fromJson(json['user_info'] as Map<String, dynamic>),
      searchedUserInfo: json['searched_user_info'] == null
          ? _defaultUserInfoData
          : UserInfoData.fromJson(
              json['searched_user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserStateImplToJson(_$UserStateImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', const CustomStringConvert().toJson(instance.email));
  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull(
      'username', const CustomStringConvert().toJson(instance.username));
  writeNotNull('avatar', const CustomStringConvert().toJson(instance.avatar));
  val['user_info'] = instance.userInfo.toJson();
  val['searched_user_info'] = instance.searchedUserInfo.toJson();
  return val;
}
