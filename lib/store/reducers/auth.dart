import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/saved_state.dto.dart';
import 'package:anti_fake_book/services/save_to_disk_service.dart';
import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/state/auth.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:flutter/material.dart';

AntiFakeBookState onSignInPending(
    AntiFakeBookState state, PendingSignInAction action) {
  showLoadingDialog(action.extras['context']);
  return state;
}

AntiFakeBookState onSignInSuccess(
    AntiFakeBookState state, SuccessSignInAction action) {
  Navigator.of(action.extras['context']).pop();
  if (isSuccessCode(action.payload.code)) {
    action.extras['onSuccess']?.call(action.payload);
    ApiModel.token = action.payload.data.token;
    print("sign in token: ${ApiModel.token}");
    AntiFakeBookState newState = state.copyWith(
      userState: state.userState.copyWith(
        userInfo: state.userState.userInfo.copyWith(
          id: action.payload.data.id,
          email: action.extras['request'].email,
          username: action.payload.data.username,
          avatar: action.payload.data.avatar,
          active: action.payload.data.active,
          coins: action.payload.data.coins,
        ),
      ),
    );
    return newState;
  } else {
    showErrorDialog(action.extras['context'], action.payload.code,
        apiType: ApiType.signIn);
    return state;
  }
}
// AntiFakeBookState onSignInError(
//     AntiFakeBookState state, ErrorSignInAction action) {
//   Navigator.of(action.extras['context']).pop();
//   showErrorDialog(action.extras['context'], action.payload.code, apiType: ApiType.signIn);
//   return state;
// }

AntiFakeBookState onSignUpSuccess(
    AntiFakeBookState state, SuccessSignUpAction action) {
  Navigator.of(action.extras['context']).pop();
  if (isSuccessCode(action.payload.code)) {
    action.extras['onSuccess']?.call(action.payload);
    return state.copyWith(
        authState: state.authState.copyWith(
            email: action.extras['request'].email,
            password: action.extras['request'].password,
            uuid: action.extras['request'].uuid));
  } else {
    showErrorDialog(action.extras['context'], action.payload.code,
        apiType: ApiType.signUp);
    return state;
  }
}

AntiFakeBookState onSignUpPending(
    AntiFakeBookState state, PendingSignUpAction action) {
  showLoadingDialog(action.extras['context']);
  return state;
}

AntiFakeBookState onSuccessCheckVerifyCode(
    AntiFakeBookState state, SuccessCheckVerifyCodeAction action) {
  action.extras['onSuccess']?.call(action.payload);
  return state;
}

AntiFakeBookState onPendingCheckVerifyCode(
    AntiFakeBookState state, PendingCheckVerifyCodeAction action) {
  action.extras['onPending']?.call();
  return state;
}

AntiFakeBookState onSuccessGetVerifyCode(
    AntiFakeBookState state, SuccessGetVerifyCodeAction action) {
  action.extras['onSuccess']?.call(action.payload);
  return state;
}

AntiFakeBookState onPendingGetVerifyCode(
    AntiFakeBookState state, PendingGetVerifyCodeAction action) {
  action.extras['onPending']?.call();
  return state;
}

AntiFakeBookState onDeleteToken(
    AntiFakeBookState state, DeleteTokenAction action) {
  ApiModel.token = "";
  return state.copyWith(token: "");
}
