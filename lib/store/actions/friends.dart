import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:flutter/material.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

class GetUserFriendsAction
    extends FutureAction<GetUserFriendsAction, GetUserFriendsResponse> {
  final GetUserFriendsRequest data;
  final Function(GetUserFriendsResponse)? onSuccess;

  GetUserFriendsAction(
      {required this.data, this.onSuccess})
      : super(future: ApiModel.api.getUserFriends(data), extras: {
          'request': data,
          'onSuccess': onSuccess
        });
}

typedef SuccessGetUserFriendsAction
    = FutureSucceededAction<GetUserFriendsAction, GetUserFriendsResponse>;

class UnfriendAction extends FutureAction<UnfriendAction, void> {
  final UnfriendRequest data;
  final BuildContext context;
  final Function? onSuccess;

  UnfriendAction({required this.data, required this.context, this.onSuccess})
      : super(future: ApiModel.api.unfriend(data), extras: {
          'context': context,
          'request': data,
          'onSuccess': onSuccess
        });
}

typedef SuccessUnfriendAction
    = FutureSucceededAction<UnfriendAction, UnfriendResponse>;
