import '../actions/post.dart';
import '../state/index.dart';

AntiFakeBookState onCreatePostPending(
    AntiFakeBookState state, PendingCreatePostAction action) {
  print('onCreatePostPending');
  state.postState.isPosting = true;
  return state;
}

AntiFakeBookState onCreatePostSuccess(
    AntiFakeBookState state, SuccessCreatePostAction action) {
  state.postState.isPosting = false;
  state.userState.coins = action.payload.data.coins;
  print(action.payload.data.id);
  return state;
}
