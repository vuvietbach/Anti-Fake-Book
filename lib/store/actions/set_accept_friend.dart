import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/set_accept_friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

import '../../models/base_apis/dto/response/set_accept_friend.dto.dart';

interface class AcceptFriendAction {}

class SetAcceptFriendAction
    extends FutureAction<SetAcceptFriendAction, SetAcceptFriendResponseDTO>
    implements AcceptFriendAction {
  SetAcceptFriendRequestDTO acceptInfo;
  final Function? onSuccess;
  final Function? onPending;

  SetAcceptFriendAction(
      {required this.acceptInfo, this.onSuccess, this.onPending})
      : super(
          future: ApiModel.api.SetAcceptFriend(acceptInfo),
          extras: {'onSuccess': onSuccess, 'onPending': onPending},
        );
}

typedef PendingSetAcceptFriendAction
    = FuturePendingAction<SetAcceptFriendAction>;
typedef SuccessSetAcceptFriendAction
    = FutureSucceededAction<SetAcceptFriendAction, SetAcceptFriendResponseDTO>;
