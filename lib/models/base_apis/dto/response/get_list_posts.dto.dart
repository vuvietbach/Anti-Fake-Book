import 'package:json_annotation/json_annotation.dart';

part 'get_list_posts.dto.g.dart';

@JsonSerializable()
class GetListPostsResponseDTO {
  final String? code;
  final String? message;
  final DataPayloadDTO data;

  GetListPostsResponseDTO(
      {required this.code, required this.message, required this.data});

  factory GetListPostsResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$GetListPostsResponseDTOFromJson(json);
}

@JsonSerializable()
class DataPayloadDTO {
  @JsonKey(fromJson: postListFromJson, toJson: postListToJson)
  final List<EachPostPayloadDTO> post;
  final String? new_items;
  final String? last_id;

  DataPayloadDTO({
    this.post = const [],
    this.new_items,
    this.last_id,
  });

  factory DataPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$DataPayloadDTOFromJson(json);

  static List<EachPostPayloadDTO> postListFromJson(List<dynamic> list) =>
      list.map((item) => EachPostPayloadDTO.fromJson(item)).toList();

  static List<dynamic> postListToJson(List<EachPostPayloadDTO> list) =>
      list.map((item) => item.toJson()).toList();

  Map<String, dynamic> toJson() => _$DataPayloadDTOToJson(this);
}

@JsonSerializable()
class EachPostPayloadDTO {
  final String? id;
  final String? name;
  @JsonKey(defaultValue: [])
  final List<String> image;
  @JsonKey(defaultValue: [])
  final List<VideoInPostPayloadDTO> video;
  final String? described;
  final String? created;
  final String? feel;
  final String? comment_mark;
  final String? is_felt;
  final String? is_blocked;
  final String? can_edit;
  final String? banned;
  final String? status;
  final AuthorPayloadDTO? author;

  EachPostPayloadDTO({
    this.id,
    this.name,
    this.image = const [],
    this.video = const [],
    this.described,
    this.created,
    this.feel,
    this.comment_mark,
    this.is_felt,
    this.is_blocked,
    this.can_edit,
    this.banned,
    this.status,
    this.author,
  });

  factory EachPostPayloadDTO.fromJson(Map<String, dynamic> json) =>
      EachPostPayloadDTO(
        id: json['id'],
        name: json['name'],
        image: (json['image'] as List<dynamic>?)
                ?.map((item) => item.toString())
                .toList() ??
            [],
        video: (json['video'] as List<dynamic>?)
                ?.map((item) => VideoInPostPayloadDTO.fromJson(item))
                .toList() ??
            [],
        described: json['described'],
        created: json['created'],
        feel: json['feel'],
        comment_mark: json['comment_mark'],
        is_felt: json['is_felt'],
        is_blocked: json['is_blocked'],
        can_edit: json['can_edit'],
        banned: json['banned'],
        status: json['status'],
        author: json['author'] != null
            ? AuthorPayloadDTO.fromJson(json['author'])
            : null,
      );

  Map<String, dynamic> toJson() => _$EachPostPayloadDTOToJson(this);
}

@JsonSerializable()
class AuthorPayloadDTO {
  final String? id;
  final String? username;
  final String? avatar;

  AuthorPayloadDTO({
    this.id,
    this.username,
    this.avatar,
  });

  factory AuthorPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthorPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorPayloadDTOToJson(this);
}

@JsonSerializable()
class VideoInPostPayloadDTO {
  final String id;
  final String url;
  final String thumb;

  VideoInPostPayloadDTO({
    required this.id,
    required this.url,
    required this.thumb,
  });

  factory VideoInPostPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$VideoInPostPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$VideoInPostPayloadDTOToJson(this);
}
