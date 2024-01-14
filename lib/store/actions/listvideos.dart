import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

import '../../models/base_apis/dto/request/get_list_videos.dart';
import '../../models/base_apis/dto/response/get_list_videos.dto.dart';

interface class ListVideosAction {}

class GetListVideosAction
    extends FutureAction<GetListVideosAction, GetListVideosResponseDTO>
    implements ListVideosAction {
  GetListVideosRequestDTO videoData;
  final Function? onSuccess;
  final Function? onPending;

  GetListVideosAction({required this.videoData, this.onSuccess, this.onPending})
      : super(
          future: ApiModel.api.GetListVideos(videoData),
          extras: {'onSuccess': onSuccess, 'onPending': onPending},
        );
}

class UpdateListVideoAction {
  final EachVideoPayloadDTO updatedVideo;
  final int index;

  UpdateListVideoAction(this.updatedVideo, this.index);
}

typedef PendingGetListVideosAction = FuturePendingAction<GetListVideosAction>;
typedef SuccessGetListVideosAction
    = FutureSucceededAction<GetListVideosAction, GetListVideosResponseDTO>;
