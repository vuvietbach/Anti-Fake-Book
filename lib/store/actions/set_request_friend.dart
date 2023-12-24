import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/set_accept_friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/set_request_friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

import '../../models/base_apis/dto/response/set_accept_friend.dto.dart';

interface class SetRequestFriendAction {}

class SetRequestInviteAction
    extends FutureAction<SetRequestFriendAction, SetRequestFriendResponseDTO>
    implements SetRequestFriendAction {
  SetRequestFriendRequestDTO requestInfo;
  final Function? onSuccess;
  final Function? onPending;

  SetRequestInviteAction(
      {required this.requestInfo, this.onSuccess, this.onPending})
      : super(
          future: ApiModel.api.SetRequestFriend(requestInfo),
          extras: {'onSuccess': onSuccess, 'onPending': onPending},
        );
}

typedef PendingSetRequestFriendAction
    = FuturePendingAction<SetRequestInviteAction>;
typedef SuccessSetRequestFriendAction = FutureSucceededAction<
    SetRequestInviteAction, SetRequestFriendResponseDTO>;
