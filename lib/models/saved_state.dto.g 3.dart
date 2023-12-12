// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_state.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedState _$SavedStateFromJson(Map<String, dynamic> json) => SavedState(
      token: json['token'] == null
          ? ""
          : const CustomStringConvert().fromJson(json['token']),
      email: json['email'] == null
          ? ""
          : const CustomStringConvert().fromJson(json['email']),
      username: json['username'] == null
          ? ""
          : const CustomStringConvert().fromJson(json['username']),
    );

Map<String, dynamic> _$SavedStateToJson(SavedState instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull(
      'username', const CustomStringConvert().toJson(instance.username));
  writeNotNull('email', const CustomStringConvert().toJson(instance.email));
  return val;
}
