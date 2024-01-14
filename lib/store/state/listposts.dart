import 'package:anti_fake_book/models/base_apis/dto/response/get_list_posts.dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'listposts.g.dart';
part 'listposts.freezed.dart';

@unfreezed
class ListPostsState with _$ListPostsState {
  factory ListPostsState({
    @Default([]) List<EachPostPayloadDTO> post,
    @Default("") String newItems,
    @Default("") String lastId,
  }) = _ListPostsState;

  factory ListPostsState.fromJson(Map<String, dynamic> json) =>
      _$ListPostsStateFromJson(json);
}
