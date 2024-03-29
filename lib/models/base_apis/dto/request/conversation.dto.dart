import 'package:anti_fake_book/utils.dart';
part 'conversation.dto.g.dart';

@customJsonSerializable
class GetListConversationRequest {
  final String token;
  final String index;
  final String count;
  GetListConversationRequest(
      {required this.token, required this.index, required this.count});
  factory GetListConversationRequest.fromJson(Map<String, dynamic> json) =>
      _$GetListConversationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetListConversationRequestToJson(this);
}

@customJsonSerializable
class GetConversationRequest {
  final String token;
  final String? partnerId;
  final String? conversationId;
  final String index;
  final String count;
  GetConversationRequest(
      {required this.token,
      this.conversationId,
      this.partnerId,
      required this.index,
      required this.count});
  factory GetConversationRequest.fromJson(Map<String, dynamic> json) =>
      _$GetConversationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetConversationRequestToJson(this);
}

@customJsonSerializable
class SetReadMessageRequest {
  final String token;
  final String? partnerId;
  final String? conversationId;
  SetReadMessageRequest(
      {required this.token, this.conversationId, this.partnerId});
  factory SetReadMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SetReadMessageRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SetReadMessageRequestToJson(this);
}

@customJsonSerializable
class DeleteMessageRequest {
  final String token;
  final String messageId;
  final String? conversationId;
  final String? partnerId;
  DeleteMessageRequest(
      {required this.token,
      required this.messageId,
      this.conversationId,
      this.partnerId});
  factory DeleteMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteMessageRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteMessageRequestToJson(this);
}

@customJsonSerializable
class DeleteConversationRequest {
  final String token;
  final String? conversationId;
  final String? partnerId;
  DeleteConversationRequest(
      {required this.token, this.conversationId, this.partnerId});
  factory DeleteConversationRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteConversationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteConversationRequestToJson(this);
}
