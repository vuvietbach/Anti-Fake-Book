import '../actions/post.dart';
import '../state/index.dart';

AntiFakeBookState onCreatePostPending(
    AntiFakeBookState preState, PendingCreatePostAction action) {
  print('onCreatePostPending');
  AntiFakeBookState newState = preState.copyWith.postState(isPosting: true);
  return newState;
}

AntiFakeBookState onCreatePostSuccess(
    AntiFakeBookState preState, SuccessCreatePostAction action) {
  print(preState.postState);
  AntiFakeBookState newState = preState.copyWith.postState(isPosting: false);
  return newState;
}
