import 'package:anti_fake_book/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_recommended_friends.dto.g.dart';

@customJsonSerializable
class GetRecommendedFriendsResponseDTO {
  final String? code;
  final String? message;
  final List<RecommendedFriendsPayloadDTO> data;

  GetRecommendedFriendsResponseDTO({
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetRecommendedFriendsResponseDTO.fromJson(Map<String, dynamic> json) {
    return _$GetRecommendedFriendsResponseDTOFromJson(json);
  }
}

@customJsonSerializable
class RecommendedFriendsPayloadDTO {
  final String? id;
  final String? username;
  final String? avatar;
  final String? sameFriends;

  RecommendedFriendsPayloadDTO({
    this.id,
    this.username,
    this.avatar,
    this.sameFriends,
  });

  factory RecommendedFriendsPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$RecommendedFriendsPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedFriendsPayloadDTOToJson(this);
}
