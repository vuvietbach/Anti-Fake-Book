import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/actions/friends.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

void changeProfileAfterSignUp(
    BuildContext context, ChangeProfileAfterSignUpRequest data,
    {Function? onSuccess, Function? onPending, Function? onError}) {
  StoreProvider.of<AntiFakeBookState>(context)
      .dispatch(ChangeProfileAfterSignUpAction(
          data: data,
          context: context,
          onSuccess: (ChangeProfileAfterSignUpResponse response) {
            context.go('/home');
          }));
}

void getUserInfo(BuildContext context, GetUserInfoRequest data,
    {Function? onSuccess, Function? onPending, Function? onError}) {
  StoreProvider.of<AntiFakeBookState>(context).dispatch(GetUserInfoAction(
    context: context,
    data: data,
  ));
}

void blockUser() {}

void getUserFriends(BuildContext context, String? userId, bool isFirstTime,
    {Function(GetUserFriendsResponse)? onSuccess, Function? onPending, Function? onError}) {
  AntiFakeBookState state = StoreProvider.of<AntiFakeBookState>(context).state;
  GetUserFriendsRequest data;
  if (isFirstTime) {
    data = GetUserFriendsRequest(
        index: 0, count: NUM_QUERY_PER_REQUEST, userId: userId);
  } else {
    bool isOwner = isAccountOwner(userId, state);
    int index = isOwner
        ? state.friendState.userFriends.length
        : state.friendState.searchedUserFriends.length;
    data = GetUserFriendsRequest(
        index: index, count: NUM_QUERY_PER_REQUEST, userId: userId);
  }
  StoreProvider.of<AntiFakeBookState>(context).dispatch(GetUserFriendsAction(
    context: context,
    data: data,
    onSuccess: onSuccess,
  ));
}
