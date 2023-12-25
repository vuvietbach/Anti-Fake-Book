import '../actions/set_request_friend.dart';
import '../state/index.dart';

AntiFakeBookState onSetRequestInvitePending(
    AntiFakeBookState state, PendingSetRequestFriendAction action) {
  // print('onSetRequestInvitePending');
  return state;
}

AntiFakeBookState onSetRequestInviteSuccess(
    AntiFakeBookState state, SuccessSetRequestFriendAction action) {
  action.extras['onSuccess']!();
  // print(action.payload.code);
  // print(action.payload.message);
  action.extras['onSuccess']?.call(action.payload);
  return state;
}
