import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/user_info.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/user_info.dto.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

class SetUserInfoAction
    extends FutureAction<SetUserInfoAction, SetUserInfoResponse> {
  final String token;
  final SetUserInfoRequest data;
  final Function(SetUserInfoResponse)? onSuccess;
  final Function? onPending;
  final Function? onError;
  SetUserInfoAction(
      {required this.token,
      required this.data,
      this.onSuccess,
      this.onPending,
      this.onError})
      : super(future: ApiModel.api.setUserInfo(token, data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessSetUserInfoAction
    = FutureSucceededAction<SetUserInfoAction, SetUserInfoResponse>;
typedef PendingSetUserInfoAction = FuturePendingAction<SetUserInfoAction>;

class GetUserInfoAction
    extends FutureAction<GetUserInfoAction, GetUserInfoResponse> {
  final GetUserInfoRequest data;
  final String token;
  final Function? onSuccess;
  final Function? onPending;
  final Function? onError;
  GetUserInfoAction(
      {required this.token,
      required this.data,
      this.onSuccess,
      this.onPending,
      this.onError})
      : super(future: ApiModel.api.getUserInfo(token, data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError,
          'userId': data.userId,
        });
}

typedef SuccessGetUserInfoAction
    = FutureSucceededAction<GetUserInfoAction, GetUserInfoResponse>;
typedef PendingGetUserInfoAction = FuturePendingAction<GetUserInfoAction>;
