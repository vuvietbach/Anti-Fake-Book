import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/auth.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/auth.dto.dart';
import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

void signIn(BuildContext context, SignInRequest request,
    {Function(SignInResponse)? onSuccess,
    Function? onPending,
    Function? onError}) {
  StoreProvider.of<AntiFakeBookState>(context).dispatch(SignInAction(
      data: request,
      context: context,
      onSuccess: (SignInResponse response) {
        EmptyLayoutState.of(context).touchLoading(false);
        if (onSuccess != null) {
          onSuccess(response);
        } else {
          context.go('/');
        }
      },
      onPending: () => EmptyLayoutState.of(context).touchLoading(true),
      onError: onError));
}

void signIn1(BuildContext context, SignInRequest request,
    {Function(SignInResponse)? onSuccess,
    Function? onPending,
    Function? onError}) {
  StoreProvider.of<AntiFakeBookState>(context).dispatch(SignInAction(
      data: request,
      context: context,
      onSuccess: (SignInResponse response) {
        onSuccess!(response);
      },
      onPending: () => {},
      onError: onError));
}
