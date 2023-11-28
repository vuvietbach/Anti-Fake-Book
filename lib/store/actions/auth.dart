import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/sign_in.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/sign_in.dto.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

class SignInAction extends FutureAction<SignInAction, SignInResponse> {
  final SignInRequestDTO data;
  final Function? onSuccess;
  final Function? onPending;
  SignInAction({required this.data, this.onSuccess, this.onPending})
      : super(
            future: ApiModel.api.signIn(data),
            extras: {'onSuccess': onSuccess, 'onPending': onPending});
}

typedef SuccessSignInAction
    = FutureSucceededAction<SignInAction, SignInResponse>;
typedef PendingSignInAction = FuturePendingAction<SignInAction>;
