import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:flutter/material.dart';

import '../actions/post.dart';
import '../state/index.dart';

AntiFakeBookState onCreatePostPending(
    AntiFakeBookState preState, PendingCreatePostAction action) {
  AntiFakeBookState newState = preState.copyWith.postState(isPosting: true);
  return newState;
}

AntiFakeBookState onCreatePostSuccess(
    AntiFakeBookState preState, SuccessCreatePostAction action) {
  AntiFakeBookState newState = preState.copyWith.postState(isPosting: false);
  return newState;
}

AntiFakeBookState onSetSellectedPost(
    AntiFakeBookState preState, SetSelectedPostAction action) {
  AntiFakeBookState newState =
      preState.copyWith.postState(selected: action.post);
  return newState;
}

AntiFakeBookState onReportPostPending(
    AntiFakeBookState preState, PendingReportPostAction action) {
  return preState;
}

AntiFakeBookState onReportPostSuccess(
    AntiFakeBookState preState, SuccessReportPostAction action) {
  return preState;
}

AntiFakeBookState onDeletePostPending(
    AntiFakeBookState preState, PendingDeletePostAction action) {
  // BuildContext context = action.extras['context'];
  // EmptyLayoutState.of(context).touchLoading(true);
  return preState;
}

AntiFakeBookState onDeletePostSuccess(
    AntiFakeBookState preState, SuccessDeletePostAction action) {
  // BuildContext context = action.extras['context'];
  // EmptyLayoutState.of(context).touchLoading(false);
  AntiFakeBookState updateListPost = preState.copyWith.listPostsState(
      post: preState.listPostsState.post
          .where((element) => element.id != action.extras['postId'])
          .toList());
  AntiFakeBookState updateCoins = updateListPost.copyWith.userState
      .userInfo(coins: action.payload.data.coins);
  return updateCoins;
}
