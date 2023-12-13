import 'package:anti_fake_book/models/base_apis/dto/response/get_post.dto.dart';
import 'package:anti_fake_book/store/state/template/bundle_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.g.dart';
part 'post.freezed.dart';

@unfreezed
class PostState extends BundleState<PostPayloadDTO> with _$PostState {
  factory PostState({
    @Default(PostPayloadDTO()) PostPayloadDTO selected,
    @Default([]) List<PostPayloadDTO> listSelections,
    @Default(0) int totalSelections,
    @Default(false) bool isPosting,
  }) = _PostState;

  factory PostState.fromJson(Map<String, dynamic> json) =>
      _$PostStateFromJson(json);
}
