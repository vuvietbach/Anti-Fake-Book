import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/auth.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/auth.dto.dart';
import 'package:flutter/material.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

class SignInAction extends FutureAction<SignInAction, SignInResponse> {
  final SignInRequest data;
  final Function(SignInResponse data)? onSuccess;
  final Function? onPending;
  final Function? onError;
  final BuildContext context;
  SignInAction(
      {required this.data,
      required this.context,
      this.onSuccess,
      this.onPending,
      this.onError})
      : super(future: ApiModel.api.signIn(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError,
          'context': context,
          'request': data
        });
}

typedef SuccessSignInAction
    = FutureSucceededAction<SignInAction, SignInResponse>;
typedef PendingSignInAction = FuturePendingAction<SignInAction>;
typedef ErrorSignInAction = FutureFailedAction<SignInAction>;

class SignUpAction extends FutureAction<SignUpAction, SignUpResponse> {
  final SignUpRequest data;
  final Function(SignUpResponse)? onSuccess;
  final Function? onPending;
  final Function? onError;
  final BuildContext context;
  SignUpAction(
      {required this.data,
      required this.context,
      this.onSuccess,
      this.onPending,
      this.onError})
      : super(future: ApiModel.api.signUp(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError,
          'context': context,
          'request': data,
        });
}

typedef SuccessSignUpAction
    = FutureSucceededAction<SignUpAction, SignUpResponse>;
typedef PendingSignUpAction = FuturePendingAction<SignUpAction>;
typedef ErrorSignUpAction = FutureFailedAction<SignUpAction>;

class LogOutAction extends FutureAction<LogOutAction, LogOutResponse> {
  final LogOutRequest data;
  final Function? onSuccess;
  final Function? onPending;
  final Function? onError;
  LogOutAction(
      {required this.data, this.onSuccess, this.onPending, this.onError})
      : super(future: ApiModel.api.logOut(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessLogOutAction
    = FutureSucceededAction<LogOutAction, LogOutResponse>;
typedef PendingLogOutAction = FuturePendingAction<LogOutAction>;

class GetVerifyCodeAction
    extends FutureAction<GetVerifyCodeAction, GetVerifyCodeResponse> {
  final GetVerifyCodeRequest data;
  final Function(GetVerifyCodeResponse)? onSuccess;
  final Function? onPending;
  final Function? onError;
  GetVerifyCodeAction(
      {required this.data, this.onSuccess, this.onPending, this.onError})
      : super(future: ApiModel.api.getVerifyCode(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessGetVerifyCodeAction
    = FutureSucceededAction<GetVerifyCodeAction, GetVerifyCodeResponse>;
typedef PendingGetVerifyCodeAction = FuturePendingAction<GetVerifyCodeAction>;

class CheckVerifyCodeAction
    extends FutureAction<CheckVerifyCodeAction, CheckVerifyCodeResponse> {
  final CheckVerifyCodeRequest data;
  final Function(CheckVerifyCodeResponse)? onSuccess;
  final Function? onPending;
  final Function? onError;
  CheckVerifyCodeAction(
      {required this.data, this.onSuccess, this.onPending, this.onError})
      : super(future: ApiModel.api.checkVerifyCode(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessCheckVerifyCodeAction
    = FutureSucceededAction<CheckVerifyCodeAction, CheckVerifyCodeResponse>;
typedef PendingCheckVerifyCodeAction
    = FuturePendingAction<CheckVerifyCodeAction>;
typedef ErrorCheckVerifyCodeAction = FutureFailedAction<CheckVerifyCodeAction>;
