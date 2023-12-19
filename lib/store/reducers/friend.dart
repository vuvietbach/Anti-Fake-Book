import 'dart:ffi';

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
  // bool isOwner = action.extras['request'].userId == null ||
  //     action.extras['request'].userId == state.userState.userInfo.id;
  // List<Friend> friendList;
  // int totalNumFriend;
  // if (isOwner) {
  //   friendList = state.friendState.userFriends;
  //   totalNumFriend = state.friendState.userTotalNumFriend;
  // } else {
  //   friendList = state.friendState.searchedUserFriends;
  //   totalNumFriend = state.friendState.searchedUserTotalNumFriend;
  // }
  // if (action.extras['request'].index == 0) {
  //   friendList = action.payload.friends;
  //   totalNumFriend = action.payload.total;
  // } else {
  //   friendList.addAll(action.payload.friends);
  //   totalNumFriend = action.payload.total;
  // }
  // friendList = sortFriendList(friendList);
  // if (isOwner) {
  //   return state.copyWith(
  //     friendState: state.friendState.copyWith(
  //       userFriends: friendList,
  //       userTotalNumFriend: totalNumFriend,
  //     ),
  //   );
  // } else {
  //   return state.copyWith(
  //     friendState: state.friendState.copyWith(
  //       searchedUserFriends: friendList,
  //       searchedUserTotalNumFriend: totalNumFriend,
  //     ),
  //   );
  // }
  action.extras['onSuccess']?.call(action.payload);
  return state;
}

AntiFakeBookState onUnfriendSuccess(
    AntiFakeBookState state, SuccessUnfriendAction action) {
  action.extras['onSuccess']?.call();
  return state;
}
