import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/search.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/search.dto.dart';
import 'package:flutter/material.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

class GetSavedSearchAction
    extends FutureAction<GetSavedSearchAction, GetSavedSearchResponse> {
  final GetSavedSearchRequest data;
  final BuildContext context;
  final Function(GetSavedSearchResponse)? onSuccess;
  final Function? onPending;
  final Function? onError;
  GetSavedSearchAction(
      {required this.context,
      required this.data,
      this.onSuccess,
      this.onPending,
      this.onError})
      : super(future: ApiModel.api.getSavedSearch(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError,
          'context': context,
        });
}

typedef SuccessGetSavedSearchAction
    = FutureSucceededAction<GetSavedSearchAction, GetSavedSearchResponse>;
typedef PendingGetSavedSearchAction = FuturePendingAction<GetSavedSearchAction>;

class DelSavedSearchAction
    extends FutureAction<DelSavedSearchAction, DelSavedSearchResponse> {
  final BuildContext context;
  final DelSavedSearchRequest data;
  final Function(DelSavedSearchResponse)? onSuccess;
  final Function? onPending;
  final Function? onError;
  DelSavedSearchAction(
      {required this.context,
      required this.data,
      this.onSuccess,
      this.onPending,
      this.onError})
      : super(future: ApiModel.api.delSavedSearch(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError,
          'request': data,
        });
}

typedef SuccessDelSavedSearchAction
    = FutureSucceededAction<DelSavedSearchAction, DelSavedSearchResponse>;
typedef PendingDelSavedSearchAction = FuturePendingAction<DelSavedSearchAction>;
