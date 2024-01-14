import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

interface class RecommendedFriendsAction {}

class GetRecommendedFriendsAction extends FutureAction<
    GetRecommendedFriendsAction,
    GetRecommendedFriendsResponseDTO> implements RecommendedFriendsAction {
  GetRecommendedFriendsRequestDTO listUsers;
  final Function? onSuccess;
  final Function? onPending;

  GetRecommendedFriendsAction(
      {required this.listUsers, this.onSuccess, this.onPending})
      : super(
          future: ApiModel.api.GetRecommendedFriends(listUsers),
          extras: {'onSuccess': onSuccess, 'onPending': onPending},
        );
}

typedef PendingGetRecommendedFriendsAction
    = FuturePendingAction<GetRecommendedFriendsAction>;
typedef SuccessGetRecommendedFriendsAction = FutureSucceededAction<
    GetRecommendedFriendsAction, GetRecommendedFriendsResponseDTO>;
