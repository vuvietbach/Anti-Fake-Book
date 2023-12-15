import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/store/state/user_info.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:flutter/material.dart';

AntiFakeBookState onPendingGetUserInfo(
    AntiFakeBookState state, PendingGetUserInfoAction action) {
  if (action.extras['onPending'] != null) action.extras['onPending']!();
  return state;
}

AntiFakeBookState onSuccessGetUserInfo(
    AntiFakeBookState state, SuccessGetUserInfoAction action) {
  if (isSuccessCode(action.payload.code)) {
    if (action.extras['onSuccess'] != null) {
      action.extras['onSuccess']!(action.payload);
    }
    AntiFakeBookState newState = state;
    if (isSuccessCode(action.payload.code)) {
      UserInfo userInfo = state.userState.userInfo;
      if (action.extras['request'].userId == null ||
          action.extras['request'].userId == state.userState.userInfo.id) {
        userInfo = UserInfo.fromJson(action.payload.data.toJson());
      }
      newState = state.copyWith(
        userState: state.userState.copyWith(
          userInfo: userInfo,
          searchedUserInfo: UserInfo.fromJson(action.payload.data.toJson()),
        ),
      );
    }
    return newState;
  } else {
    showErrorDialog(action.extras['context'], action.payload.code,
        apiType: ApiType.getUserInfo);
    return state;
  }
}

AntiFakeBookState onPendingSetUserInfo(
    AntiFakeBookState state, PendingSetUserInfoAction action) {
  showLoadingDialog(action.extras['context']);
  return state;
}

AntiFakeBookState onSuccessSetUserInfo(
    AntiFakeBookState state, SuccessSetUserInfoAction action) {
  Navigator.pop(action.extras['context']);
  if (isSuccessCode(action.payload.code)) {
    if (action.extras['onSuccess'] != null) {
      action.extras['onSuccess']!(action.payload);
    }
    AntiFakeBookState newState = state;
    Map<String, dynamic> userInfo = {
      ...state.userState.userInfo.toJson(),
      ...action.extras['request'].toJson(),
      ...action.payload.data.toJson(),
    };
    newState = state.copyWith(
      userState: state.userState.copyWith(
        userInfo: UserInfo.fromJson(userInfo),
      ),
    );
    print(newState.userState.userInfo.toJson());
    return newState;
  } else {
    showErrorDialog(action.extras['context'], action.payload.code,
        apiType: ApiType.getUserInfo);
    return state;
  }
}

AntiFakeBookState onPendingChangeProfileAfterSignUp(
    AntiFakeBookState state, PendingChangeProfileAfterSignUpAction action) {
  showLoadingDialog(action.extras['context']);
  return state;
}

AntiFakeBookState onSuccessChangeProfileAfterSignUp(
    AntiFakeBookState state, SuccessChangeProfileAfterSignUpAction action) {
  Navigator.of(action.extras['context']).pop();
  if (isSuccessCode(action.payload.code)) {
    action.extras['onSuccess']?.call(action.payload);
    AntiFakeBookState newState = state;
    ChangeProfileAfterSignUpResponse response = action.payload;
    newState = state.copyWith(
        userState: state.userState.copyWith(
            userInfo: UserInfo(
      id: response.data.id,
      username: response.data.username,
      avatar: response.data.avatar,
      email: response.data.email,
      created: response.data.created,
    )));
    return newState;
  } else {
    showErrorDialog(action.extras['context'], action.payload.code,
        apiType: ApiType.changeProfileAfterSignUp);
    return state;
  }
}
