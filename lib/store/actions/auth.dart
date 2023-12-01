import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/auth.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/auth.dto.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

class SignInAction extends FutureAction<SignInAction, SignInResponse> {
  final SignInRequest data;
  final Function(SignInResponse data)? onSuccess;
  final Function? onPending;
  final Function? onError;
  SignInAction(
      {required this.data, this.onSuccess, this.onPending, this.onError})
      : super(future: ApiModel.api.signIn(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessSignInAction
    = FutureSucceededAction<SignInAction, SignInResponse>;
typedef PendingSignInAction = FuturePendingAction<SignInAction>;

class SignUpAction extends FutureAction<SignUpAction, SignUpResponse> {
  final SignUpRequest data;
  final Function? onSuccess;
  final Function? onPending;
  final Function? onError;
  SignUpAction(
      {required this.data, this.onSuccess, this.onPending, this.onError})
      : super(future: ApiModel.api.signUp(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessSignUpAction
    = FutureSucceededAction<SignUpAction, SignUpResponse>;
typedef PendingSignUpAction = FuturePendingAction<SignUpAction>;

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
  final Function? onSuccess;
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
  final Function? onSuccess;
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
