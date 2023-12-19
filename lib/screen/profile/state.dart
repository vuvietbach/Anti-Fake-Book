import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/user_info.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/actions/friends.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/store/state/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FriendState {
  List<Friend> friends;
  int total;
  String? userId;
  FriendState({this.friends = const [], this.total = 0, required this.userId});
  void sortFriendsByName() {
    friends.sort((a, b) => a.username.compareTo(b.username));
  }

  void onSuccessLoadMore(GetUserFriendsResponse response, bool isFirstTime,
      Function(FriendState)? callback) {
    if (isFirstTime) {
      friends = response.friends;
      total = response.total;
    } else {
      friends.addAll(response.friends);
      total = response.total;
    }
    sortFriendsByName();
    callback?.call(this);
  }

  void loadMore(BuildContext context,
      {bool isFirstTime = true, Function(FriendState)? callback}) {
    Store<AntiFakeBookState> store =
        StoreProvider.of<AntiFakeBookState>(context);
    int index = 0;
    if (!isFirstTime) {
      index = friends.length;
    }
    GetUserFriendsRequest data = GetUserFriendsRequest(
        index: index, count: NUM_QUERY_PER_REQUEST, userId: userId);
    store.dispatch(GetUserFriendsAction(
        data: data,
        context: context,
        onSuccess: (GetUserFriendsResponse response) {
          onSuccessLoadMore(response, isFirstTime, callback);
        }));
  }

  void unfriend(BuildContext context, String userId,
      {Function(FriendState)? callback}) {
    Store<AntiFakeBookState> store =
        StoreProvider.of<AntiFakeBookState>(context);
    UnfriendRequest data = UnfriendRequest(userId: userId);
    store.dispatch(UnfriendAction(
        data: data,
        context: context,
        onSuccess: () => _onSuccessUnfriend(userId, callback)));
  }

  void _onSuccessUnfriend(String userId, Function(FriendState)? callback) {
    friends.removeWhere((element) => element.id == userId);
    total -= 1;
    callback?.call(this);
  }
}

class UserState {
  String? userId;
  UserInfo userInfo = const UserInfo();
  UserState({this.userId});
  void reload(BuildContext context, {Function(UserState)? callback}) {
    Store<AntiFakeBookState> store =
        StoreProvider.of<AntiFakeBookState>(context);
    store.dispatch(GetUserInfoAction(
      context: context,
      data: GetUserInfoRequest(userId: userId),
      onSuccess: (GetUserInfoResponse response) {
        userInfo = UserInfo.fromJson(response.data.toJson());
        callback?.call(this);
      },
    ));
  }
}
