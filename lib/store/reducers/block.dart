import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/plugins/index.dart';
import 'package:anti_fake_book/store/actions/block.dart';
import 'package:anti_fake_book/store/state/index.dart';

AntiFakeBookState onSuccessGetListBlocksAction(
    AntiFakeBookState preState, SuccessGetListBlocksAction action) {
  AntiFakeBookState newState =
      preState.copyWith.userState(blocks: action.payload);
  EmptyLayoutState.of(action.extras['context']).touchLoading(false);
  return newState;
}

void onPendingGetListBlocksAction(
    AntiFakeBookState preState, GetListBlocksAction action) {
  EmptyLayoutState.of(action.extras['context']).touchLoading(true);
}

AntiFakeBookState onSuccessSetBlockAction(
    AntiFakeBookState preState, SuccessSetBlockAction action) {
  Plugins.antiFakeBookStore!.dispatch(GetListBlocksAction(0, 5, action.extras));
  final oldFriendState = preState.friendState;
  final newFriendState =
      oldFriendState.removeFriend(action.extras['userId'] ?? "");
  return preState.copyWith(friendState: newFriendState);
}
