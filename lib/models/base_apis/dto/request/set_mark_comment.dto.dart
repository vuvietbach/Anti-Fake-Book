import 'package:anti_fake_book/utils.dart';
part 'set_mark_comment.dto.g.dart';

@customJsonSerializable
class SetMarkCommentRequest {
  String id = '';
  String content = '';
  int index = 0;
  int count = 0;
  String markId = '';
  int type = 0;
  SetMarkCommentRequest();
  factory SetMarkCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$SetMarkCommentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SetMarkCommentRequestToJson(this);
}
