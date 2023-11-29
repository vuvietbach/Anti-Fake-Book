import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/auth.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/auth.dto.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

class SignInAction extends FutureAction<SignInAction, SignInResponse> {
  final SignInRequest data;
  final Function? onSuccess;
  final Function? onPending;
  final Function? onError;
  SignInAction({required this.data, this.onSuccess, this.onPending, this.onError})
      : super(
            future: ApiModel.api.signIn(data),
            extras: {'onSuccess': onSuccess, 'onPending': onPending, 'onError': onError});
}

typedef SuccessSignInAction
    = FutureSucceededAction<SignInAction, SignInResponse>;
typedef PendingSignInAction = FuturePendingAction<SignInAction>;
