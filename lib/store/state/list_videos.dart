import 'package:anti_fake_book/models/base_apis/dto/response/get_list_videos.dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'list_videos.g.dart';
part 'list_videos.freezed.dart';

@unfreezed
class ListVideosState with _$ListVideosState {
  factory ListVideosState({
    @Default([]) List<EachVideoPayloadDTO> post,
    @Default("") String newItems,
    @Default("") String lastId,
  }) = _ListVideosState;

  factory ListVideosState.fromJson(Map<String, dynamic> json) =>
      _$ListVideosStateFromJson(json);
}
