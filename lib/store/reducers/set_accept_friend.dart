import '../../constants/constants.dart';
import '../../models/base_apis/dto/response/response.dto.dart';
import '../actions/requested_friends.dart';
import '../actions/set_accept_friend.dart';
import '../state/app.dart';
import '../state/index.dart';
import '../state/requested_friends.dart';

AntiFakeBookState onSetAcceptFriendPending(
    AntiFakeBookState state, PendingSetAcceptFriendAction action) {
  // print('onSetAcceptFriendPending');
  return state;
}

AntiFakeBookState onSetAcceptFriendSuccess(
    AntiFakeBookState state, SuccessSetAcceptFriendAction action) {
  action.extras['onSuccess']!();
  // print(action.payload.code);
  // print(action.payload.message);
  action.extras['onSuccess']?.call(action.payload);
  return state;
}
