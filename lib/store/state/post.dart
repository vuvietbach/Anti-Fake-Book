import 'package:anti_fake_book/models/base_apis/dto/response/get_post.dto.dart';
import 'package:anti_fake_book/store/state/template/bundle_state.dart';

class PostState extends BundleState<PostPayloadDTO> {
  bool isPosting = false;
  PostState.initState() {
    selected = PostPayloadDTO();
    listSelections = [];
    totalSelections = 0;
  }
}
