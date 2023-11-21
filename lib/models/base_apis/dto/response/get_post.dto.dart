import 'package:anti_fake_book/global_type/user/user_summary.entity.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/response.dto.dart';
import 'package:anti_fake_book/utils.dart';
part 'get_post.dto.g.dart';

@customJsonSerializable
class GetPostResponseDTO extends ResponseDTO {
  PostPayloadDTO data;
  GetPostResponseDTO(this.data) : super();
  factory GetPostResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$GetPostResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$GetPostResponseDTOToJson(this);
}

@customJsonSerializable
class PostPayloadDTO {
  String? id;
  String? name;
  DateTime? created;
  DateTime? modified;
  int? fake;
  int? trust;
  int? kudos;
  int? disappointed;
  bool? isRated;
  bool? isMarked;
  List<ImagePayloadDTO> images;
  List<VideoPayloadDTO> video;
  AuthorPostPayloadDTO? author;
  PostCategory? category;
  int? state;
  bool? isBlock;
  bool? canEdit;
  bool? banned;
  int? canMark;
  int? canRate;
  String? url;
  String? messages;
  PostPayloadDTO({this.images = const [], this.video = const []});
  factory PostPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$PostPayloadDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PostPayloadDTOToJson(this);
}

@customJsonSerializable
class PostCategory {
  String? id;
  String? name;
  String? hasName;
  PostCategory(this.id, this.name, this.hasName);
  factory PostCategory.fromJson(Map<String, dynamic> json) =>
      _$PostCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$PostCategoryToJson(this);
}

@customJsonSerializable
class AuthorPostPayloadDTO extends UserSummaryEntity {
  List<String> listing;
  AuthorPostPayloadDTO(this.listing, String id, String name, int coins)
      : super(id, name, coins);
  factory AuthorPostPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthorPostPayloadDTOFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorPostPayloadDTOToJson(this);
}

@customJsonSerializable
class ImagePayloadDTO {
  String id;
  String url;
  ImagePayloadDTO(this.url, this.id);
  factory ImagePayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$ImagePayloadDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ImagePayloadDTOToJson(this);
}

@customJsonSerializable
class VideoPayloadDTO {
  String id;
  String url;
  String thumb;
  VideoPayloadDTO(this.url, this.id, this.thumb);
  factory VideoPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$VideoPayloadDTOFromJson(json);
  Map<String, dynamic> toJson() => _$VideoPayloadDTOToJson(this);
}
