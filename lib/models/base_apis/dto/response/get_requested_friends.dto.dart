import 'package:anti_fake_book/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_requested_friends.dto.g.dart';

@customJsonSerializable
class GetRequestedFriendsResponseDTO {
  final String? code;
  final String? message;
  final DataRequestedFriendsPayloadDTO data;
  final String total;

  GetRequestedFriendsResponseDTO({
    required this.code,
    required this.message,
    required this.data,
    required this.total,
  });

  factory GetRequestedFriendsResponseDTO.fromJson(Map<String, dynamic> json) {
    return _$GetRequestedFriendsResponseDTOFromJson(json);
  }
}

@customJsonSerializable
class DataRequestedFriendsPayloadDTO {
  final List<RequestedFriendsPayloadDTO> requests;

  DataRequestedFriendsPayloadDTO({
    required this.requests,
  });

  factory DataRequestedFriendsPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$DataRequestedFriendsPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DataRequestedFriendsPayloadDTOToJson(this);
}

@JsonSerializable()
class RequestedFriendsPayloadDTO {
  @JsonKey(name: 'id')
  final String? userId;
  final String? username;
  final String? avatar;
  @JsonKey(name: 'same_friends')
  final String? sameFriends;
  final String? created;

  RequestedFriendsPayloadDTO({
    this.userId,
    this.username,
    this.avatar,
    this.sameFriends,
    this.created,
  });

  factory RequestedFriendsPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$RequestedFriendsPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RequestedFriendsPayloadDTOToJson(this);
}
