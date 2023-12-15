import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/screen/profile/change_profile_after_signup_page.dart';
import 'package:anti_fake_book/screen/sign_in/redux_actions.dart';
import 'package:anti_fake_book/screen/sign_up/routes.dart';
import 'package:anti_fake_book/screen/sign_up/sign_up.dart';
import 'package:anti_fake_book/services/notification_service.dart';
import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

void getVerifyCode(BuildContext context, Store<AntiFakeBookState> store,
    GetVerifyCodeRequest data,
    {Function(GetVerifyCodeResponse)? onSuccess}) {
  store.dispatch(GetVerifyCodeAction(
    data: data,
    onSuccess: (GetVerifyCodeResponse response) {
      if (isSuccessCode(response.code)) {
        NotificationService.showNotification("Mã xác thực",
            "Mã xác thực của bạn là ${response.data.verifyCode}");
      } else {
        showErrorDialog(context, response.code, apiType: ApiType.getVerifyCode);
      }
    },
  ));
}

void checkVerifyCode(BuildContext context, CheckVerifyCodeRequest data,
    {Function? onSuccess}) {
  Store<AntiFakeBookState> store = StoreProvider.of<AntiFakeBookState>(context);
  store.dispatch(CheckVerifyCodeAction(
    data: data,
    onSuccess: (CheckVerifyCodeResponse response) {
      signIn(
          context,
          SignInRequest(
              email: store.state.authState.email,
              password: store.state.authState.password,
              uuid: store.state.authState.uuid),
          onSuccess: (SignInResponse response) =>
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangeProfileAfterSignUpPage(
                        email: store.state.authState.email,
                      ))));
    },
  ));
}

void signUp(BuildContext context, SignUpRequest data,
    {Function(SignUpResponse response)? onSuccess,
    Function? onError,
    Function? onPending}) {
  StoreProvider.of<AntiFakeBookState>(context).dispatch(SignUpAction(
      data: data,
      context: context,
      onSuccess: (SignUpResponse response) {
        NotificationService.showNotification("Mã xác thực đăng ký",
            "Mã xác thực của bạn là ${response.data.verifyCode}");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return VerifyAccountPage(
            email: data.email,
          );
        }));
      },
      onError: onError,
      onPending: onPending));
}
