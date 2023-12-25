import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/utils.dart';
part 'set_mark_comment.dto.g.dart';

@customJsonSerializable
class SetMarkCommentResponseDto extends GetMarkCommentResponseDto {
  int coins = 0;
  SetMarkCommentResponseDto();
  factory SetMarkCommentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SetMarkCommentResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SetMarkCommentResponseDtoToJson(this);
}
