import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/saved_state.dto.dart';
import 'package:anti_fake_book/services/save_to_disk_service.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/response.dto.dart';
import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/state/app.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/store/state/user.dart';
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
      if(isSuccessCode(action.payload.code)) {
        action.extras['onSuccess']?.call(action.payload);
        AntiFakeBookState newState = state.copyWith(
          token: action.payload.data.token,
          userState: state.userState.copyWith(
            userInfo: state.userState.userInfo.copyWith(
              id: action.payload.data.id,
              username: action.payload.data.username,
              avatar: action.payload.data.avatar,
              active: action.payload.data.active,
              coins: action.payload.data.coins,
            ),
          ),
        );
        // save state to disk
        DiskStore.saveState(SavedState(
          token: action.payload.data.token,
          userInfo: state.userState.userInfo
        ));
        return newState;

      } else {
        showErrorDialog(action.extras['context'], action.payload.code, apiType: ApiType.signIn);
        return state;
      }

}

AntiFakeBookState onSignUpSuccess(
    AntiFakeBookState state, SuccessSignUpAction action) {
  action.extras['onSuccess']?.call(action.payload);
  return state;
}

AntiFakeBookState onSignUpPending(
    AntiFakeBookState state, PendingSignUpAction action) {
  action.extras['onPending']?.call();
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
