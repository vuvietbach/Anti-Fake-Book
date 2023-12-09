import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/services/notification_service.dart';
import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:flutter/material.dart';
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

void checkVerifyCode(BuildContext context, Store<AntiFakeBookState> store,
    CheckVerifyCodeRequest data,
    {Function? onSuccess}) {
  store.dispatch(CheckVerifyCodeAction(
      data: data,
      onSuccess: (CheckVerifyCodeResponse response) {
        if (isSuccessCode(response.code)) {
          onSuccess?.call();
        } else {
          showErrorDialog(context, response.code,
              apiType: ApiType.checkVerifyCode);
        }
      },
      onPending: () {
        showLoadingDialog(context);
      }));
}

void signUp(
    BuildContext context, Store<AntiFakeBookState> store, SignUpRequest data,
    {Function? onSuccess}) {
  store.dispatch(SignUpAction(
      data: data,
      onSuccess: (SignUpResponse response) {
        if (isSuccessCode(response.code)) {
          onSuccess?.call();
        } else {
          showErrorDialog(context, response.code, apiType: ApiType.signUp);
        }
      },
      onPending: () {
        showLoadingDialog(context);
      }));
}
