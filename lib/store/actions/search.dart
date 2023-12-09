import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/search.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/search.dto.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

class GetSavedSearchAction
    extends FutureAction<GetSavedSearchAction, GetSavedSearchResponse> {
  final String token;
  final GetSavedSearchRequest data;
  final Function? onSuccess;
  final Function? onPending;
  final Function? onError;
  GetSavedSearchAction(
      {required this.token,
      required this.data,
      this.onSuccess,
      this.onPending,
      this.onError})
      : super(future: ApiModel.api.getSavedSearch(token, data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessGetSavedSearchAction
    = FutureSucceededAction<GetSavedSearchAction, GetSavedSearchResponse>;
typedef PendingGetSavedSearchAction = FuturePendingAction<GetSavedSearchAction>;

class DelSavedSearchAction
    extends FutureAction<DelSavedSearchAction, DelSavedSearchResponse> {
  final String token;
  final DelSavedSearchRequest data;
  final Function? onSuccess;
  final Function? onPending;
  final Function? onError;
  DelSavedSearchAction(
      {required this.token,
      required this.data,
      this.onSuccess,
      this.onPending,
      this.onError})
      : super(future: ApiModel.api.delSavedSearch(token, data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError,
          "searchId": data.searchId
        });
}

typedef SuccessDelSavedSearchAction
    = FutureSucceededAction<DelSavedSearchAction, DelSavedSearchResponse>;
typedef PendingDelSavedSearchAction = FuturePendingAction<DelSavedSearchAction>;
