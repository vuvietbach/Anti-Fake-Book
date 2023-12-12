// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationStateImpl _$$ConversationStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationStateImpl(
      conversations: (json['conversations'] as List<dynamic>?)
              ?.map((e) => ConversationInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentConversation: json['currentConversation'] == null
          ? const ConversationMetadata(isBlocked: 0, conversation: [])
          : ConversationMetadata.fromJson(
              json['currentConversation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConversationStateImplToJson(
        _$ConversationStateImpl instance) =>
    <String, dynamic>{
      'conversations': instance.conversations,
      'currentConversation': instance.currentConversation,
    };
