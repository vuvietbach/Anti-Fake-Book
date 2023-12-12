// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AntiFakeBookStateImpl _$$AntiFakeBookStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AntiFakeBookStateImpl(
      responseDTO:
          ResponseDTO.fromJson(json['response_d_t_o'] as Map<String, dynamic>),
      appState: AppState.fromJson(json['app_state'] as Map<String, dynamic>),
      postState: PostState.fromJson(json['post_state'] as Map<String, dynamic>),
      userState: UserState.fromJson(json['user_state'] as Map<String, dynamic>),
      searchState:
          SearchState.fromJson(json['search_state'] as Map<String, dynamic>),
      conversationState: ConversationState.fromJson(
          json['conversation_state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AntiFakeBookStateImplToJson(
        _$AntiFakeBookStateImpl instance) =>
    <String, dynamic>{
      'response_d_t_o': instance.responseDTO.toJson(),
      'app_state': instance.appState.toJson(),
      'post_state': instance.postState.toJson(),
      'user_state': instance.userState.toJson(),
      'search_state': instance.searchState.toJson(),
      'conversation_state': instance.conversationState.toJson(),
    };
