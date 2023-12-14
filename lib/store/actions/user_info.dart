import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/auth.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/user_info.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/auth.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/user_info.dto.dart';
import 'package:flutter/material.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

class SetUserInfoAction
    extends FutureAction<SetUserInfoAction, SetUserInfoResponse> {
  final SetUserInfoRequest data;
  final Function(SetUserInfoResponse)? onSuccess;
  final Function? onPending;
  final Function? onError;
  final BuildContext context;
  SetUserInfoAction(
      {required this.context,
      required this.data,
      this.onSuccess,
      this.onPending,
      this.onError})
      : super(future: ApiModel.api.setUserInfo(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError,
          'context': context,
          'request': data,
        });
}

typedef SuccessSetUserInfoAction
    = FutureSucceededAction<SetUserInfoAction, SetUserInfoResponse>;
typedef PendingSetUserInfoAction = FuturePendingAction<SetUserInfoAction>;

class GetUserInfoAction
    extends FutureAction<GetUserInfoAction, GetUserInfoResponse> {
  final GetUserInfoRequest data;
  final Function(GetUserInfoResponse)? onSuccess;
  final Function? onPending;
  final Function? onError;
  final BuildContext context;
  GetUserInfoAction(
      {required this.context,
      required this.data,
      this.onSuccess,
      this.onPending,
      this.onError})
      : super(future: ApiModel.api.getUserInfo(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError,
          'request': data,
          'context': context,
        });
}

typedef SuccessGetUserInfoAction
    = FutureSucceededAction<GetUserInfoAction, GetUserInfoResponse>;
typedef PendingGetUserInfoAction = FuturePendingAction<GetUserInfoAction>;

class ChangeProfileAfterSignUpAction extends FutureAction<
    ChangeProfileAfterSignUpAction, ChangeProfileAfterSignUpResponse> {
  final ChangeProfileAfterSignUpRequest data;
  final Function(ChangeProfileAfterSignUpResponse)? onSuccess;
  final Function? onPending;
  final Function? onError;
  final BuildContext context;
  ChangeProfileAfterSignUpAction(
      {required this.data,
      required this.context,
      this.onSuccess,
      this.onPending,
      this.onError})
      : super(future: ApiModel.api.changeProfileAfterSignUp(data), extras: {
          'onSuccess': onSuccess,
          'onError': onError,
          'onPending': onPending,
          'context': context,
        });
}

typedef SuccessChangeProfileAfterSignUpAction = FutureSucceededAction<
    ChangeProfileAfterSignUpAction, ChangeProfileAfterSignUpResponse>;
typedef PendingChangeProfileAfterSignUpAction
    = FuturePendingAction<ChangeProfileAfterSignUpAction>;
