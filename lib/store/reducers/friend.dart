import 'package:anti_fake_book/helper/helper.dart';
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
    var friendList = state.friendState.userFriends;
    if (action.extras['request'].index == 0) {
      friendList = action.payload.friends;
    } else {
      friendList.addAll(action.payload.friends);
    }
    return state.copyWith(
      friendState: state.friendState.copyWith(
        userFriends: friendList,
        userTotalNumFriend: action.payload.total,
      ),
    );
  } else {
    return state;
  }
}

AntiFakeBookState onUnfriendSuccess(
    AntiFakeBookState state, SuccessUnfriendAction action) {
  action.extras['onSuccess']?.call();
  return state;
}
