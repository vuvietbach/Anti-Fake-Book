import 'package:anti_fake_book/models/base_apis/dto/request/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/get_requested_friends.dart';
import 'package:anti_fake_book/plugins/index.dart';
import 'package:anti_fake_book/store/actions/friends.dart';

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
  // action.extras['onSuccess']!();
  Plugins.antiFakeBookStore!.dispatch(GetUserFriendsAction(
      data: GetUserFriendsRequest(index: 0, count: NUM_QUERY_PER_REQUEST)));
  // action.extras['onSuccess']?.call(action.payload);
  return state;
}
