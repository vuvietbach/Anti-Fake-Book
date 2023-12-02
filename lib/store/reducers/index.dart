import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/actions/common.dart';
import 'package:anti_fake_book/store/reducers/auth.dart';
import 'package:anti_fake_book/store/reducers/common.dart';
import 'package:anti_fake_book/store/reducers/post.dart';
import 'package:redux/redux.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

import '../actions/index.dart';
import '../state/index.dart';

//hàm in ra FailureCreatePostAction
AntiFakeBookState failureCreatePostAction(
    AntiFakeBookState state, FutureFailedAction action) {
  print(action.error);
  return state;
}

final antiFakeBookReducers = combineReducers<AntiFakeBookState>([
  TypedReducer<AntiFakeBookState, PendingCreatePostAction>(onCreatePostPending),
  TypedReducer<AntiFakeBookState, SuccessCreatePostAction>(onCreatePostSuccess),
  TypedReducer<AntiFakeBookState, FutureFailedAction>(failureCreatePostAction),
  TypedReducer<AntiFakeBookState, SetSelectedPostAction>(onSetSellectedPost),
  TypedReducer<AntiFakeBookState, SuccessSignInAction>(onSignInSuccess),
  TypedReducer<AntiFakeBookState, PendingSignInAction>(onSignInPending),
  TypedReducer<AntiFakeBookState, ResetResponseAction>(onResetResponse),
  TypedReducer<AntiFakeBookState, PendingReportPostAction>(onReportPostPending),
  TypedReducer<AntiFakeBookState, SuccessReportPostAction>(onReportPostSuccess),
]);
