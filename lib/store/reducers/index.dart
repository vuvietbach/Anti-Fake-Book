import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/actions/block.dart';
import 'package:anti_fake_book/store/actions/common.dart';
import 'package:anti_fake_book/store/actions/conversation.dart';
import 'package:anti_fake_book/store/actions/requested_friends.dart';
import 'package:anti_fake_book/store/actions/friends.dart';
import 'package:anti_fake_book/store/actions/search.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/reducers/auth.dart';
import 'package:anti_fake_book/store/reducers/block.dart';
import 'package:anti_fake_book/store/reducers/common.dart';
import 'package:anti_fake_book/store/reducers/conversation.dart';
import 'package:anti_fake_book/store/reducers/friend.dart';
import 'package:anti_fake_book/store/reducers/post.dart';
import 'package:anti_fake_book/store/reducers/requested_friends.dart';
import 'package:anti_fake_book/store/reducers/search.dart';
import 'package:anti_fake_book/store/reducers/user_info.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

import '../actions/index.dart';
import '../actions/listposts.dart';
import '../state/index.dart';
import 'listposts.dart';

//hàm in ra FailureCreatePostAction
AntiFakeBookState onDefaultFaulureAction(
    AntiFakeBookState state, FutureFailedAction action) {
  print(action.extras['context']);
  if (action.extras['context'] == null) {
    print(action.error);
    return state;
  }
  BuildContext context = action.extras['context'];
  EmptyLayoutState.of(context).touchLoading(false);
  bool isStandardError = true;
  ResponseDTO? responseDTO;
  try {
    print(action.error.response!.data);
    responseDTO = ResponseDTO.fromJson(action.error.response!.data);
  } catch (e) {
    print(e);
    isStandardError = false;
  }
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: !isStandardError
              ? Text('Something wrong')
              : Text(responseDTO!.code.toString()),
          content: !isStandardError
              ? Text(action.error.toString())
              : Text(responseDTO!.message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"))
          ],
        );
      });
  return state;
}

final antiFakeBookReducers = combineReducers<AntiFakeBookState>([
  TypedReducer<AntiFakeBookState, SuccessGetListBlocksAction>(
      onSuccessGetListBlocksAction),
  TypedReducer<AntiFakeBookState, SuccessSetBlockAction>(
      onSuccessSetBlockAction),
  TypedReducer<AntiFakeBookState, PendingCreatePostAction>(onCreatePostPending),
  TypedReducer<AntiFakeBookState, SuccessCreatePostAction>(onCreatePostSuccess),
  TypedReducer<AntiFakeBookState, FutureFailedAction>(onDefaultFaulureAction),
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
  TypedReducer<AntiFakeBookState, SuccessChangeProfileAfterSignUpAction>(
      onSuccessChangeProfileAfterSignUp),
  TypedReducer<AntiFakeBookState, SuccessGetListPostsAction>(
      onGetListPostsSuccess),
  TypedReducer<AntiFakeBookState, PendingGetListPostsAction>(
      onGetListPostsPending),
  TypedReducer<AntiFakeBookState, SuccessGetRequestedFriendsAction>(
      onGetRequestedFriendsSuccess),
  TypedReducer<AntiFakeBookState, PendingGetRequestedFriendsAction>(
      onGetRequestedFriendsPending),
  TypedReducer<AntiFakeBookState, SuccessGetUserFriendsAction>(
      onSuccessGetUserFriends),

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
