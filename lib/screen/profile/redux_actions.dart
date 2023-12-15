import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

void changeProfileAfterSignUp(
    BuildContext context, ChangeProfileAfterSignUpRequest data,
    {Function? onSuccess, Function? onPending, Function? onError}) {
  StoreProvider.of<AntiFakeBookState>(context)
      .dispatch(ChangeProfileAfterSignUpAction(
          data: data,
          context: context,
          onSuccess: (ChangeProfileAfterSignUpResponse response) {
            context.go('/home');
          }));
}

void getUserInfo(BuildContext context, GetUserInfoRequest data,
    {Function? onSuccess, Function? onPending, Function? onError}) {
  StoreProvider.of<AntiFakeBookState>(context).dispatch(GetUserInfoAction(
    context: context,
    data: data,
  ));
}
