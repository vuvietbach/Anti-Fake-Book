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
