import 'package:anti_fake_book/utils.dart';

part 'friend.dto.g.dart';

@customJsonSerializable
class GetUserFriendsResponse {
  final List<Friend> friends;
  final int total;
  GetUserFriendsResponse({required this.friends, required this.total});
  factory GetUserFriendsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserFriendsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserFriendsResponseToJson(this);
}

@customJsonSerializable
class Friend {
  final String id;
  final String username;
  final String avatar;
  final int sameFriends;
  final String created;
  Friend(
      {required this.id,
      required this.username,
      required this.avatar,
      required this.sameFriends,
      required this.created});
  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
  Map<String, dynamic> toJson() => _$FriendToJson(this);
}

@customJsonSerializable
class UnfriendResponse {
  final int code;
  final String message;
  UnfriendResponse({required this.code, required this.message});
  factory UnfriendResponse.fromJson(Map<String, dynamic> json) =>
      _$UnfriendResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UnfriendResponseToJson(this);
}
