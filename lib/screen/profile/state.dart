import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/user_info.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/plugins/index.dart';
import 'package:anti_fake_book/store/actions/block.dart';
import 'package:anti_fake_book/store/actions/friends.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/store/state/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FriendState {
  final List<Friend> friends;
  final int total;
  final String? userId;
  final bool isOwner;
  final Function(FriendState)? setStateCallback;
  FriendState(
      {this.friends = const [],
      this.total = 0,
      required this.userId,
      required this.setStateCallback})
      : isOwner = isAccountOwner(userId, Plugins.antiFakeBookStore!.state);

  void sortFriendsByName() {
    friends.sort((a, b) => a.username.compareTo(b.username));
  }

  void unfriend(BuildContext context, String userId) {
    if (isOwner) {
      Plugins.antiFakeBookStore!.dispatch(UnfriendAction(
          data: UnfriendRequest(userId: userId), context: context));
    }
  }

  void blockUser(BuildContext context, String userId) {
    if (isOwner) {
      Plugins.antiFakeBookStore!
          .dispatch(SetBlockAction(userId, true, {'context': context}));
    }
  }

  void getInitialFriends(BuildContext context) async {
    final request = GetUserFriendsRequest(
        index: 0, count: NUM_QUERY_PER_REQUEST, userId: userId);
    if (isOwner) {
      Plugins.antiFakeBookStore!
          .dispatch(GetUserFriendsAction(data: request, context: context));
    } else {
      callAPI(context, () async {
        final response = await ApiModel.api.getUserFriends(request);
        final newState = FriendState(
            friends: response.friends,
            total: response.total,
            userId: userId,
            setStateCallback: setStateCallback);
        setStateCallback?.call(newState);
      });
    }
  }

  void loadMoreFriends(BuildContext context) {
    final request = GetUserFriendsRequest(
        index: friends.length, count: NUM_QUERY_PER_REQUEST, userId: userId);
    if (isOwner) {
      Plugins.antiFakeBookStore!
          .dispatch(GetUserFriendsAction(data: request, context: context));
    } else {
      callAPI(context, () async {
        final response = await ApiModel.api.getUserFriends(request);
        final newState = FriendState(
            friends: response.friends,
            total: response.total,
            userId: userId,
            setStateCallback: setStateCallback);
        setStateCallback?.call(newState);
      });
    }
  }
}

class UserState {
  final String? userId;
  final UserInfo userInfo;
  final bool isOwner;
  final Function(UserState)? setStateCallback;
  UserState(
      {this.userId,
      this.userInfo = const UserInfo(),
      required this.setStateCallback})
      : isOwner = isAccountOwner(userId, Plugins.antiFakeBookStore!.state);

  void getUserInfo(BuildContext context,
      {Function(UserState)? callback}) async {
    // final response =
    //     await ApiModel.api.getUserInfo(GetUserInfoRequest(userId: userId));
    // final newState = UserState(
    //     userId: userId, userInfo: UserInfo.fromJson(response.data.toJson()));
    // callback?.call(newState);
    final request = GetUserInfoRequest(userId: userId);
    if (isOwner) {
      Plugins.antiFakeBookStore!
          .dispatch(GetUserInfoAction(data: request, context: context));
    } else {
      callAPI(context, () async {
        final response = await ApiModel.api.getUserInfo(request);
        final newState = UserState(
            userId: userId,
            userInfo: UserInfo.fromJson(response.data.toJson()),
            setStateCallback: setStateCallback);
        setStateCallback?.call(newState);
      });
    }
  }
}
