import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

void setUserInfo(BuildContext context, SetUserInfoRequest data,
    {Function(SetUserInfoResponse)? onSuccess, Function? onPending, Function? onError}) {
  StoreProvider.of<AntiFakeBookState>(context)
      .dispatch(SetUserInfoAction(context: context, data: data, onSuccess: onSuccess, onPending: onPending, onError: onError));
}
