import 'package:anti_fake_book/global_type/user/user_summary.entity.dart';
import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/response.dto.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

interface class BlockAction {}

class GetListBlocksAction
    extends FutureAction<GetListBlocksAction, List<UserSummaryEntity>>
    implements BlockAction {
  GetListBlocksAction(int index, int count, Map<String, dynamic> extras)
      : super(future: ApiModel.api.getListBlocks(index, count), extras: extras);
}

typedef PendingGetListBlocksAction = FuturePendingAction<GetListBlocksAction>;
typedef SuccessGetListBlocksAction
    = FutureSucceededAction<GetListBlocksAction, List<UserSummaryEntity>>;

class SetBlockAction extends FutureAction<SetBlockAction, ResponseDTO>
    implements BlockAction {
  SetBlockAction(String userId, bool isBlock, Map<String, dynamic> extras)
      : super(
            future: ApiModel.api.setBlock(userId, isBlock),
            extras: {...extras, "userId": userId});
}

typedef PendingSetBlockAction = FuturePendingAction<SetBlockAction>;
typedef SuccessSetBlockAction
    = FutureSucceededAction<SetBlockAction, ResponseDTO>;
