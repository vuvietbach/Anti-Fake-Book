import 'package:anti_fake_book/utils.dart';
import 'package:json_annotation/json_annotation.dart';
part 'conversation.dto.g.dart';

@customJsonSerializable
class GetListConversationResponse {
  final int code;
  final String message;
  final List<ConversationInfo> data;
  @JsonKey(name: 'numNewMessage')
  final int numNewMessage;
  GetListConversationResponse(
      {required this.code,
      required this.message,
      required this.data,
      required this.numNewMessage});
  factory GetListConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListConversationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetListConversationResponseToJson(this);
}

@customJsonSerializable
class ConversationInfo {
  final String id;
  final PartnerData partner;
  @JsonKey(name: 'lastMessage')
  final MessageData lastMessage;

  ConversationInfo(
      {required this.id, required this.partner, required this.lastMessage});
  factory ConversationInfo.fromJson(Map<String, dynamic> json) =>
      _$ConversationInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationInfoToJson(this);
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
  final int? isBlocked;
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
  final String messageId;
  final int unread;
  final String created;
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
  Map<String, dynamic> data = {
    "code": "1000",
    "message": "OK",
    "data": {
      "conversation": [
        {
          "message": "xin chào",
          "message_id": "0",
          "unread": "0",
          "created": "2023-11-10",
          "sender": {
            "id": "0",
            "username": "aloha",
            "avatar":
                "https://images.rawpixel.com/image_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA3L3JvYl9yYXdwaXhlbF9hX3N0dWRpb19waG90b19vZl9hX2JvcmRlcl9jb2xsaWVfZnVsbF9ib2R5X2lzb2xhdF84YTdhNzNmMC1jZWZiLTQ3YTEtOTJiYy1mZGIwM2RkOTJkMWMtNXgtaHEtc2NhbGUtNV8wMHguanBn.jpg"
          }
        },
        {
          "message": "xin chào",
          "message_id": "0",
          "unread": "0",
          "created": "2023-11-11",
          "sender": {
            "id": "1",
            "username": "aloha",
            "avatar":
                "https://images.rawpixel.com/image_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA3L3JvYl9yYXdwaXhlbF9hX3N0dWRpb19waG90b19vZl9hX2JvcmRlcl9jb2xsaWVfZnVsbF9ib2R5X2lzb2xhdF84YTdhNzNmMC1jZWZiLTQ3YTEtOTJiYy1mZGIwM2RkOTJkMWMtNXgtaHEtc2NhbGUtNV8wMHguanBn.jpg"
          }
        },
        {
          "message": "xin chào",
          "message_id": "0",
          "unread": "0",
          "created": "2023-11-11",
          "sender": {
            "id": "1",
            "username": "aloha",
            "avatar":
                "https://images.rawpixel.com/image_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA3L3JvYl9yYXdwaXhlbF9hX3N0dWRpb19waG90b19vZl9hX2JvcmRlcl9jb2xsaWVfZnVsbF9ib2R5X2lzb2xhdF84YTdhNzNmMC1jZWZiLTQ3YTEtOTJiYy1mZGIwM2RkOTJkMWMtNXgtaHEtc2NhbGUtNV8wMHguanBn.jpg"
          }
        },
        {
          "message": "xin chào",
          "message_id": "0",
          "unread": "0",
          "created": "2023-11-12",
          "sender": {
            "id": "0",
            "username": "aloha",
            "avatar":
                "https://images.rawpixel.com/image_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA3L3JvYl9yYXdwaXhlbF9hX3N0dWRpb19waG90b19vZl9hX2JvcmRlcl9jb2xsaWVfZnVsbF9ib2R5X2lzb2xhdF84YTdhNzNmMC1jZWZiLTQ3YTEtOTJiYy1mZGIwM2RkOTJkMWMtNXgtaHEtc2NhbGUtNV8wMHguanBn.jpg"
          }
        }
      ],
      "is_blocked": "0"
    }
  };
  GetConversationResponse data1 = GetConversationResponse.fromJson(data);
  print(data1.data.conversation[0].sender.avatar);
}
