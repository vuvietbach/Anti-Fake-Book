// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AntiFakeBookState _$AntiFakeBookStateFromJson(Map<String, dynamic> json) =>
    AntiFakeBookState(
      appState: AppState.fromJson(json['app_state'] as Map<String, dynamic>),
      postState: PostState.fromJson(json['post_state'] as Map<String, dynamic>),
      userState: UserState.fromJson(json['user_state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AntiFakeBookStateToJson(AntiFakeBookState instance) =>
    <String, dynamic>{
      'app_state': instance.appState.toJson(),
      'post_state': instance.postState.toJson(),
      'user_state': instance.userState.toJson(),
    };
