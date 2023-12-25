import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/store/actions/friends.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';

List<Friend> sortFriendList(List<Friend> friendList) {
  friendList.sort((a, b) => compareDateTimeString(b.created, a.created));
  return friendList;
}

AntiFakeBookState onSuccessGetUserFriends(
    AntiFakeBookState state, SuccessGetUserFriendsAction action) {
  action.extras['onSuccess']?.call(action.payload);

  bool isOwner = isAccountOwner(action.extras['request'].userId, state);
  if (isOwner) {
    final oldFriendState = state.friendState;
    final newFriendState = oldFriendState.addFriends(
        action.payload, action.extras['request'] as GetUserFriendsRequest);
    return state.copyWith(friendState: newFriendState);
  } else {
    return state;
  }
}

AntiFakeBookState onUnfriendSuccess(
    AntiFakeBookState state, SuccessUnfriendAction action) {
  action.extras['onSuccess']?.call();
  final oldFriendState = state.friendState;
  final newFriendState = oldFriendState.removeFriend(action.extras['request'].userId);
  return state.copyWith(friendState: newFriendState);
}
