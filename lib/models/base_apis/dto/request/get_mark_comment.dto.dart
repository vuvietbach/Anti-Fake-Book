import 'package:anti_fake_book/utils.dart';
part 'get_mark_comment.dto.g.dart';

@customJsonSerializable
class GetMarkCommentRequestDto {
  String id;
  int index;
  int count;
  GetMarkCommentRequestDto(this.id, this.index, this.count);
  factory GetMarkCommentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GetMarkCommentRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetMarkCommentRequestDtoToJson(this);
}
