import 'package:anti_fake_book/models/base_apis/dto/request/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'friend.freezed.dart';
part 'friend.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class FriendState with _$FriendState {
  const FriendState._();
  @customJsonSerializable
  factory FriendState({
    @Default([]) List<Friend> userFriends,
    @Default(0) int userTotalNumFriend,
  }) = _FriendState;

  factory FriendState.fromJson(Map<String, dynamic> json) =>
      _$FriendStateFromJson(json);

  FriendState removeFriend(String userId) {
    int oldLen = userFriends.length;
    List<Friend> newFriends = userFriends.where((e) => e.id != userId).toList();
    int newTotal = userTotalNumFriend - (oldLen - newFriends.length);
    return FriendState(userFriends: newFriends, userTotalNumFriend: newTotal);
  }

  FriendState addFriends(
      GetUserFriendsResponse response, GetUserFriendsRequest request) {
    if (request.index == 0) {
      return FriendState(
          userFriends: response.friends, userTotalNumFriend: response.total);
    } else {
      return FriendState(
          userFriends: [...userFriends, ...response.friends],
          userTotalNumFriend: response.total);
    }
  }
}
