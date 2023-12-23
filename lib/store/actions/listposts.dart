import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/post.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

import '../../models/base_apis/dto/response/get_list_posts.dto.dart';

interface class ListPostsAction {}

class GetListPostsAction
    extends FutureAction<GetListPostsAction, GetListPostsResponseDTO>
    implements ListPostsAction {
  GetListPostsRequest postData;
  final Function? onSuccess;
  final Function? onPending;

  GetListPostsAction({required this.postData, this.onSuccess, this.onPending})
      : super(
          future: ApiModel.api.getListPosts(postData),
          extras: {'onSuccess': onSuccess, 'onPending': onPending},
        );
}

class UpdateListPostAction {
  final EachPostPayloadDTO updatedPost;
  final int index;

  UpdateListPostAction(this.updatedPost, this.index);
}

typedef PendingGetListPostsAction = FuturePendingAction<GetListPostsAction>;
typedef SuccessGetListPostsAction
    = FutureSucceededAction<GetListPostsAction, GetListPostsResponseDTO>;
