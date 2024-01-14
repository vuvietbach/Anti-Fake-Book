import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/utils.dart';
part 'get_mark_comment.dto.g.dart';

@customJsonSerializable
class GetMarkCommentResponseDto extends ResponseDTO {
  List<MarkCommentResponse> data = [];
  bool? isBlocked = false;
  GetMarkCommentResponseDto();
  factory GetMarkCommentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetMarkCommentResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetMarkCommentResponseDtoToJson(this);
}

@customJsonSerializable
class MarkCommentResponse {
  String id = '';
  DateTime created = DateTime.now();
  String markContent = '';
  String typeOfMark = '';
  PosterCommentDto poster = PosterCommentDto();
  List<CommentObjectDto> comments = [];
  MarkCommentResponse();
  factory MarkCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$MarkCommentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MarkCommentResponseToJson(this);
}

@customJsonSerializable
class PosterCommentDto {
  String id = '';
  String name = '';
  String avatar = '';
  PosterCommentDto();
  factory PosterCommentDto.fromJson(Map<String, dynamic> json) =>
      _$PosterCommentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PosterCommentDtoToJson(this);
}

@customJsonSerializable
class CommentObjectDto {
  String content = '';
  DateTime created = DateTime.now();
  PosterCommentDto poster = PosterCommentDto();
  CommentObjectDto(this.content, this.poster, this.created);
  factory CommentObjectDto.fromJson(Map<String, dynamic> json) =>
      _$CommentObjectDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommentObjectDtoToJson(this);
}
