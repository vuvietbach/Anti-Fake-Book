import 'package:json_annotation/json_annotation.dart';

part 'get_list_posts.dto.g.dart';

@JsonSerializable()
class GetListPostsResponseDTO {
  final String? code;
  final String? message;
  final DataPayloadDTO data;

  GetListPostsResponseDTO({
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetListPostsResponseDTO.fromJson(Map<String, dynamic> json) {
    // try {
    //   print(_$GetListPostsResponseDTOFromJson(json));
    // } catch (e) {
    //   print('ok');
    //   print(json);
    //   print(e);
    // }
    return _$GetListPostsResponseDTOFromJson(json);
  }
}

@JsonSerializable()
class DataPayloadDTO {
  @JsonKey(name: 'post')
  final List<EachPostPayloadDTO> post;
  @JsonKey(name: 'new_items')
  final String? newItems;
  @JsonKey(name: 'last_id')
  final String? lastId;

  DataPayloadDTO({
    required this.post,
    this.newItems,
    this.lastId,
  });

  factory DataPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$DataPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DataPayloadDTOToJson(this);
}

@JsonSerializable()
class EachPostPayloadDTO {
  final String? id;
  final String? name;
  @JsonKey(name: 'image')
  final List<ImageInEachPayloadDTO> images;
  @JsonKey(name: 'video')
  final VideoInPostPayloadDTO? video;
  final String? described;
  final String? created;
  final String? feel;
  @JsonKey(name: 'comment_mark')
  final String? commentMark;
  @JsonKey(name: 'is_felt')
  final String? isFelt;
  @JsonKey(name: 'is_blocked')
  final String? isBlocked;
  @JsonKey(name: 'can_edit')
  final String? canEdit;
  final String? banned;
  final String? state;
  final AuthorPayloadDTO? author;

  EachPostPayloadDTO({
    this.id,
    this.name,
    this.images = const [],
    this.video,
    this.described,
    this.created,
    this.feel,
    this.commentMark,
    this.isFelt,
    this.isBlocked,
    this.canEdit,
    this.banned,
    this.state,
    this.author,
  });

  factory EachPostPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$EachPostPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$EachPostPayloadDTOToJson(this);
}

@JsonSerializable()
class ImageInEachPayloadDTO {
  final String? id;
  final String? url;

  ImageInEachPayloadDTO({this.id, this.url});

  factory ImageInEachPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$ImageInEachPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ImageInEachPayloadDTOToJson(this);
}

@JsonSerializable()
class VideoInPostPayloadDTO {
  final String? url;

  VideoInPostPayloadDTO({this.url});

  factory VideoInPostPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$VideoInPostPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$VideoInPostPayloadDTOToJson(this);
}

@JsonSerializable()
class AuthorPayloadDTO {
  final String? id;
  final String? name;
  final String? avatar;

  AuthorPayloadDTO({
    this.id,
    this.name,
    this.avatar,
  });

  factory AuthorPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthorPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorPayloadDTOToJson(this);
}
