import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

interface class PostAction {}

class CreatePostAction
    extends FutureAction<CreatePostAction, AddPostResponseDTO>
    implements PostAction {
  AddPostRequestDTO postData;

  CreatePostAction(this.postData)
      : super(future: ApiModel.api.addPost(postData));
}

typedef PendingCreatePostAction = FuturePendingAction<CreatePostAction>;
typedef SuccessCreatePostAction
    = FutureSucceededAction<CreatePostAction, AddPostResponseDTO>;
