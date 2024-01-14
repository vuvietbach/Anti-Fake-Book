import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

interface class PostAction {}

class CreatePostAction
    extends FutureAction<CreatePostAction, AddPostResponseDTO>
    implements PostAction {
  AddPostRequestDTO postData;

  CreatePostAction(this.postData, Function callbackOnPending,
      Function callbackOnSuccess, Map<String, dynamic> extras)
      : super(
            future: () async {
              callbackOnPending();
              AddPostResponseDTO rs =
                  await ApiModel.api.addPost(postData).whenComplete(() {
                callbackOnSuccess();
              });
              return rs;
            }(),
            extras: extras);
}

typedef PendingCreatePostAction = FuturePendingAction<CreatePostAction>;
typedef SuccessCreatePostAction
    = FutureSucceededAction<CreatePostAction, AddPostResponseDTO>;

class SetSelectedPostAction extends PostAction {
  PostPayloadDTO post;
  SetSelectedPostAction(this.post);
}

class ReportPostAction extends FutureAction<ReportPostAction, ResponseDTO>
    implements PostAction {
  ReportPostRequestDto reportData;
  ReportPostAction(this.reportData)
      : super(future: ApiModel.api.reportPost(reportData));
}

class DeletePostAction
    extends FutureAction<DeletePostAction, ModifiedPostResponseDto>
    implements PostAction {
  String postId;
  DeletePostAction(this.postId, extras)
      : super(
            future: ApiModel.api.deletePost(postId),
            extras: {'postId': postId, ...extras});
}

class FeelPostAction extends FutureAction<FeelPostAction, ResponseDTO>
    implements PostAction {
  String postId;
  bool isKudos;
  FeelPostAction(this.postId, this.isKudos, extras)
      : super(
            future: ApiModel.api.feelPost(postId, isKudos),
            extras: {'postId': postId, ...extras});
}

typedef SuccessFeelPostAction
    = FutureSucceededAction<FeelPostAction, ResponseDTO>;

typedef PendingDeletePostAction = FuturePendingAction<DeletePostAction>;
typedef SuccessDeletePostAction
    = FutureSucceededAction<DeletePostAction, ModifiedPostResponseDto>;

typedef PendingReportPostAction = FuturePendingAction<ReportPostAction>;
typedef SuccessReportPostAction
    = FutureSucceededAction<ReportPostAction, ResponseDTO>;
