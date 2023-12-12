// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListConversationRequest _$GetListConversationRequestFromJson(
        Map<String, dynamic> json) =>
    GetListConversationRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      index: const CustomStringConvert().fromJson(json['index']),
      count: const CustomStringConvert().fromJson(json['count']),
    );

Map<String, dynamic> _$GetListConversationRequestToJson(
    GetListConversationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull('index', const CustomStringConvert().toJson(instance.index));
  writeNotNull('count', const CustomStringConvert().toJson(instance.count));
  return val;
}

GetConversationRequest _$GetConversationRequestFromJson(
        Map<String, dynamic> json) =>
    GetConversationRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      conversationId:
          const CustomStringConvert().fromJson(json['conversation_id']),
      partnerId: const CustomStringConvert().fromJson(json['partner_id']),
      index: const CustomStringConvert().fromJson(json['index']),
      count: const CustomStringConvert().fromJson(json['count']),
    );

Map<String, dynamic> _$GetConversationRequestToJson(
    GetConversationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull(
      'partner_id',
      _$JsonConverterToJson<dynamic, String>(
          instance.partnerId, const CustomStringConvert().toJson));
  writeNotNull(
      'conversation_id',
      _$JsonConverterToJson<dynamic, String>(
          instance.conversationId, const CustomStringConvert().toJson));
  writeNotNull('index', const CustomStringConvert().toJson(instance.index));
  writeNotNull('count', const CustomStringConvert().toJson(instance.count));
  return val;
}

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

SetReadMessageRequest _$SetReadMessageRequestFromJson(
        Map<String, dynamic> json) =>
    SetReadMessageRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      conversationId:
          const CustomStringConvert().fromJson(json['conversation_id']),
      partnerId: const CustomStringConvert().fromJson(json['partner_id']),
    );

Map<String, dynamic> _$SetReadMessageRequestToJson(
    SetReadMessageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull(
      'partner_id',
      _$JsonConverterToJson<dynamic, String>(
          instance.partnerId, const CustomStringConvert().toJson));
  writeNotNull(
      'conversation_id',
      _$JsonConverterToJson<dynamic, String>(
          instance.conversationId, const CustomStringConvert().toJson));
  return val;
}

DeleteMessageRequest _$DeleteMessageRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteMessageRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      messageId: const CustomStringConvert().fromJson(json['message_id']),
      conversationId:
          const CustomStringConvert().fromJson(json['conversation_id']),
      partnerId: const CustomStringConvert().fromJson(json['partner_id']),
    );

Map<String, dynamic> _$DeleteMessageRequestToJson(
    DeleteMessageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull(
      'message_id', const CustomStringConvert().toJson(instance.messageId));
  writeNotNull(
      'conversation_id',
      _$JsonConverterToJson<dynamic, String>(
          instance.conversationId, const CustomStringConvert().toJson));
  writeNotNull(
      'partner_id',
      _$JsonConverterToJson<dynamic, String>(
          instance.partnerId, const CustomStringConvert().toJson));
  return val;
}

DeleteConversationRequest _$DeleteConversationRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteConversationRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      conversationId:
          const CustomStringConvert().fromJson(json['conversation_id']),
      partnerId: const CustomStringConvert().fromJson(json['partner_id']),
    );

Map<String, dynamic> _$DeleteConversationRequestToJson(
    DeleteConversationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull(
      'conversation_id',
      _$JsonConverterToJson<dynamic, String>(
          instance.conversationId, const CustomStringConvert().toJson));
  writeNotNull(
      'partner_id',
      _$JsonConverterToJson<dynamic, String>(
          instance.partnerId, const CustomStringConvert().toJson));
  return val;
}
