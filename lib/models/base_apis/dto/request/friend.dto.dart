import 'package:anti_fake_book/utils.dart';

part 'friend.dto.g.dart';

@customJsonSerializable
class GetUserFriendsRequest {
  final String? userId;
  final int index;
  final int count;
  GetUserFriendsRequest(
      {this.userId, required this.index, required this.count});
  factory GetUserFriendsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetUserFriendsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserFriendsRequestToJson(this);
}

@customJsonSerializable
class UnfriendRequest {
  final String userId;
  UnfriendRequest({required this.userId});
  factory UnfriendRequest.fromJson(Map<String, dynamic> json) =>
      _$UnfriendRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UnfriendRequestToJson(this);
}
