import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/sign_in.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/sign_in.dto.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

class SignInAction extends FutureAction<SignInAction, SignInResponseDTO> {
  SignInRequestDTO data;

  SignInAction(this.data) : super(future: ApiModel.api.signIn(data));
}

typedef PendingSignInAction = FuturePendingAction<SignInAction>;
typedef SuccessSignInAction
    = FutureSucceededAction<SignInAction, SignInResponseDTO>;
