import 'package:anti_fake_book/utils.dart';

part 'set_friend_request.dto.g.dart';

@customJsonSerializable
class SetRequestFriendResponseDTO {
  final String? code;
  final String? message;
  final DataSetRequestFriendPayloadDTO data;

  SetRequestFriendResponseDTO({
    required this.code,
    required this.message,
    required this.data,
  });

  factory SetRequestFriendResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SetRequestFriendResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SetRequestFriendResponseDTOToJson(this);
}

@customJsonSerializable
class DataSetRequestFriendPayloadDTO {
  final String requestedFriends;

  DataSetRequestFriendPayloadDTO({
    required this.requestedFriends,
  });

  factory DataSetRequestFriendPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$DataSetRequestFriendPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DataSetRequestFriendPayloadDTOToJson(this);
}
