import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/user_info.dto.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void makeSetUserInfoAction(BuildContext context, SetUserInfoRequest data,
    Store<AntiFakeBookState> store,
    {Function(SetUserInfoResponse)? onSuccess}) {
  store.dispatch(SetUserInfoAction(
      token: store.state.userState.token,
      data: data,
      onSuccess: (SetUserInfoResponse response) {
        if (!isSuccessCode(response.code)) {
          showErrorDialog(context, response.code);
        } else {
          onSuccess?.call(response);
        }
      },
      onPending: () {
        showLoadingDialog(context);
      }));
}
