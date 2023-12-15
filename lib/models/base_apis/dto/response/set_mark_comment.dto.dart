import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/utils.dart';
part 'set_mark_comment.dto.g.dart';

@customJsonSerializable
class SetMarkCommentReponseDto extends ResponseDTO {
  SetMarkCommentDataDto data = SetMarkCommentDataDto();
  int coins = 0;
  SetMarkCommentReponseDto();
  factory SetMarkCommentReponseDto.fromJson(Map<String, dynamic> json) =>
      _$SetMarkCommentReponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SetMarkCommentReponseDtoToJson(this);
}

@customJsonSerializable
class SetMarkCommentDataDto {
  String id = '';
  String markContent = '';
  PosterCommentDto poster = PosterCommentDto();
  List<CommentObjectDto> comments = [];
  SetMarkCommentDataDto();
  factory SetMarkCommentDataDto.fromJson(Map<String, dynamic> json) =>
      _$SetMarkCommentDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SetMarkCommentDataDtoToJson(this);
}
