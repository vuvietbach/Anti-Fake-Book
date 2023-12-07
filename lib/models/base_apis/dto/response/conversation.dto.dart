import 'package:anti_fake_book/utils.dart';
import 'package:json_annotation/json_annotation.dart';
part 'conversation.dto.g.dart';

@customJsonSerializable
class GetListConversationResponse {
  final int code;
  final String message;
  final List<ListConversationData> data;
  @JsonKey(name: 'numNewMessage')
  final int numNewMessage;
  GetListConversationResponse(
      {required this.code, required this.message, required this.data, required this.numNewMessage});
  factory GetListConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListConversationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetListConversationResponseToJson(this);
}

@customJsonSerializable
class ListConversationData {
  final String id;
  final PartnerData partner;
  @JsonKey(name: 'lastMessage')
  final MessageData lastMessage;

  ListConversationData(
      {required this.id, required this.partner, required this.lastMessage});
  factory ListConversationData.fromJson(Map<String, dynamic> json) =>
      _$ListConversationDataFromJson(json);
  Map<String, dynamic> toJson() => _$ListConversationDataToJson(this);
}

@customJsonSerializable
class PartnerData {
  final String id;
  final String username;
  final String avatar;

  PartnerData({required this.id, required this.username, required this.avatar});
  factory PartnerData.fromJson(Map<String, dynamic> json) =>
      _$PartnerDataFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerDataToJson(this);
}

@customJsonSerializable
class MessageData {
  final String message;
  final String created;
  final int unread;

  MessageData(
      {required this.message, required this.created, required this.unread});
  factory MessageData.fromJson(Map<String, dynamic> json) =>
      _$MessageDataFromJson(json);
  Map<String, dynamic> toJson() => _$MessageDataToJson(this);
}

@customJsonSerializable
class GetConversationResponse {
  final int code;
  final String message;
  final ConversationMetadata data;
  GetConversationResponse(
      {required this.code, required this.message, required this.data});
  factory GetConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConversationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetConversationResponseToJson(this);
}

@customJsonSerializable
class ConversationMetadata {
  @JsonKey(name: 'is_blocked')
  final int isBlocked;

  final List<ConversationData> conversation;

  const ConversationMetadata(
      {required this.isBlocked, required this.conversation});
  factory ConversationMetadata.fromJson(Map<String, dynamic> json) =>
      _$ConversationMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationMetadataToJson(this);
}

@customJsonSerializable
class ConversationData {
  final String message;
  @JsonKey(name: 'message_id')
  final String messageId;
  final String created;
  final int unread;
  final PartnerData sender;

  ConversationData(
      {required this.message,
      required this.messageId,
      required this.created,
      required this.unread,
      required this.sender});
  factory ConversationData.fromJson(Map<String, dynamic> json) =>
      _$ConversationDataFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationDataToJson(this);
}

@customJsonSerializable
class SetReadMessageResponse {
  final int code;
  final String message;
  SetReadMessageResponse({required this.code, required this.message});
  factory SetReadMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SetReadMessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SetReadMessageResponseToJson(this);
}

@customJsonSerializable
class DeleteMessageResponse {
  final int code;
  final String message;
  DeleteMessageResponse({required this.code, required this.message});
  factory DeleteMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteMessageResponseToJson(this);
}

@customJsonSerializable
class DeleteConversationResponse {
  final int code;
  final String message;
  DeleteConversationResponse({required this.code, required this.message});
  factory DeleteConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteConversationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteConversationResponseToJson(this);
}

void main() {
  Map<String, dynamic> data =  {"code": 1000, "message": "OK", "data": [{"id": 0, "partner": {"id": 0, "username": "aloha", "avatar": "https://images.rawpixel.com/image_png_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA3L3JvYl9yYXdwaXhlbF9hX3N0dWRpb19waG90b19vZl9hX3B1Z19mdWxsX2JvZHlfaXNvbGF0ZWRfb25fd2hpdF84MjQ0ZjE0Ny1kMDQ4LTRjNWYtYTVjYi1mYWE3YzQwMWI1YzctNXgtaHEtc2NhbGUtNV8wMHgtam9iMTg5NF8xLnBuZw.png"}, "lastMessage": {
    "message": "Xin chao. Toi la Aloha", "created": "2023-11-10", "unread": 1}}], "numNewMessage": 1};
  final getListConversationResponse =
      GetListConversationResponse.fromJson(data);
  print(getListConversationResponse.data[0].lastMessage.message);
}