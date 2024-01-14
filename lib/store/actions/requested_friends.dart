import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

interface class RequestedFriendsAction {}

class GetRequestedFriendsAction extends FutureAction<GetRequestedFriendsAction,
    GetRequestedFriendsResponseDTO> implements RequestedFriendsAction {
  GetRequestedFriendsRequestDTO listUsers;
  final Function? onSuccess;
  final Function? onPending;

  GetRequestedFriendsAction(
      {required this.listUsers, this.onSuccess, this.onPending})
      : super(
          future: ApiModel.api.GetRequestedFriends(listUsers),
          extras: {'onSuccess': onSuccess, 'onPending': onPending},
        );
}

typedef PendingGetRequestedFriendsAction
    = FuturePendingAction<GetRequestedFriendsAction>;
typedef SuccessGetRequestedFriendsAction = FutureSucceededAction<
    GetRequestedFriendsAction, GetRequestedFriendsResponseDTO>;
