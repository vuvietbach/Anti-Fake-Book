// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserState _$UserStateFromJson(Map<String, dynamic> json) => UserState(
      avatar: const CustomStringConvert().fromJson(json['avatar']),
      username: const CustomStringConvert().fromJson(json['username']),
      coins: json['coins'] as int,
    );

Map<String, dynamic> _$UserStateToJson(UserState instance) => <String, dynamic>{
      'avatar': const CustomStringConvert().toJson(instance.avatar),
      'username': const CustomStringConvert().toJson(instance.username),
      'coins': instance.coins,
    };
