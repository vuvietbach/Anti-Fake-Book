import 'package:anti_fake_book/models/base_apis/dto/request/auth.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/auth.dto.dart';
import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

void signIn(BuildContext context, SignInRequest request,
    {Function(SignInResponse)? onSuccess,
    Function? onPending,
    Function? onError}) {
  StoreProvider.of<AntiFakeBookState>(context).dispatch(SignInAction(
      data: request,
      context: context,
      onSuccess: onSuccess,
      onPending: onPending,
      onError: onError));
}
