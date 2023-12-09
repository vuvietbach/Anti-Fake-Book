import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/actions/common.dart';
import 'package:anti_fake_book/store/actions/conversation.dart';
import 'package:anti_fake_book/store/actions/search.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/reducers/auth.dart';
import 'package:anti_fake_book/store/reducers/common.dart';
import 'package:anti_fake_book/store/reducers/conversation.dart';
import 'package:anti_fake_book/store/reducers/post.dart';
import 'package:anti_fake_book/store/reducers/search.dart';
import 'package:anti_fake_book/store/reducers/user_info.dart';
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
  TypedReducer<AntiFakeBookState, SuccessSignUpAction>(onSignUpSuccess),
  TypedReducer<AntiFakeBookState, PendingSignUpAction>(onSignUpPending),
  TypedReducer<AntiFakeBookState, SuccessCheckVerifyCodeAction>(
      onSuccessCheckVerifyCode),
  TypedReducer<AntiFakeBookState, PendingCheckVerifyCodeAction>(
      onPendingCheckVerifyCode),
  TypedReducer<AntiFakeBookState, SuccessGetVerifyCodeAction>(
      onSuccessGetVerifyCode),
  TypedReducer<AntiFakeBookState, PendingGetVerifyCodeAction>(
      onPendingGetVerifyCode),
  TypedReducer<AntiFakeBookState, ResetResponseAction>(onResetResponse),
  TypedReducer<AntiFakeBookState, PendingReportPostAction>(onReportPostPending),
  TypedReducer<AntiFakeBookState, SuccessReportPostAction>(onReportPostSuccess),
  TypedReducer<AntiFakeBookState, PendingGetSavedSearchAction>(
      onGetSavedSearchPending),
  TypedReducer<AntiFakeBookState, SuccessGetSavedSearchAction>(
      onGetSavedSearchSuccess),
  TypedReducer<AntiFakeBookState, PendingDelSavedSearchAction>(
      onDelSavedSearchPending),
  TypedReducer<AntiFakeBookState, SuccessDelSavedSearchAction>(
      onDelSavedSearchSuccess),
  TypedReducer<AntiFakeBookState, PendingGetUserInfoAction>(
      onPendingGetUserInfo),
  TypedReducer<AntiFakeBookState, SuccessGetUserInfoAction>(
      onSuccessGetUserInfo),
  TypedReducer<AntiFakeBookState, PendingSetUserInfoAction>(
      onPendingSetUserInfo),
  TypedReducer<AntiFakeBookState, SuccessSetUserInfoAction>(
      onSuccessSetUserInfo),
  TypedReducer<AntiFakeBookState, PendingGetListConversationAction>(
      onPendingGetListConversation),
  TypedReducer<AntiFakeBookState, SuccessGetListConversationAction>(
      onSuccessGetListConversation),
  TypedReducer<AntiFakeBookState, PendingGetConversationAction>(
      onPendingGetConversation),
  TypedReducer<AntiFakeBookState, SuccessGetConversationAction>(
      onSuccessGetConversation),
  // TypedReducer<AntiFakeBookState, PendingSetReadMessageAction>(onPendingSetReadMessage),
  // TypedReducer<AntiFakeBookState, SuccessSetReadMessageAction>(onSuccessSetReadMessage),
  // TypedReducer<AntiFakeBookState, PendingDeleteMessageAction>(onPendingDeleteMessage),
  // TypedReducer<AntiFakeBookState, SuccessDeleteMessageAction>(onSuccessDeleteMessage),
  // TypedReducer<AntiFakeBookState, PendingDeleteConversationAction>(onPendingDeleteConversation),
  // TypedReducer<AntiFakeBookState, SuccessDeleteConversationAction>(onSuccessDeleteConversation),
]);

AntiFakeBookState onNetworkError(AntiFakeBookState state, action) {
  return state;
}
