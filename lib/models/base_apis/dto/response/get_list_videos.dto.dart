import 'package:anti_fake_book/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_list_videos.dto.g.dart';

@customJsonSerializable
class GetListVideosResponseDTO {
  final String? code;
  final String? message;
  final DataListVideosPayloadDTO data;

  GetListVideosResponseDTO({
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetListVideosResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$GetListVideosResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$GetListVideosResponseDTOToJson(this);
}

@customJsonSerializable
class DataListVideosPayloadDTO {
  final List<EachVideoPayloadDTO> post;
  final String? newItems;
  final String? lastId;

  DataListVideosPayloadDTO({
    required this.post,
    this.newItems,
    this.lastId,
  });

  factory DataListVideosPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$DataListVideosPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DataListVideosPayloadDTOToJson(this);
}

@customJsonSerializable
class EachVideoPayloadDTO {
  final String? id;
  final String? name;
  final VideoInVideoPayloadDTO? video;
  final String? described;
  final String? created;
  final String? feel;
  final String? commentMark;
  final String? isFelt;
  final String? isBlocked;
  final String? canEdit;
  final String? banned;
  final String? state;
  final AuthorVideoPayloadDTO? author;

  EachVideoPayloadDTO({
    this.id,
    this.name,
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

  factory EachVideoPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$EachVideoPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$EachVideoPayloadDTOToJson(this);
}

@customJsonSerializable
class VideoInVideoPayloadDTO {
  final String? url;

  VideoInVideoPayloadDTO({this.url});

  factory VideoInVideoPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$VideoInVideoPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$VideoInVideoPayloadDTOToJson(this);
}

@customJsonSerializable
class AuthorVideoPayloadDTO {
  final String? id;
  final String? name;
  final String? avatar;

  AuthorVideoPayloadDTO({
    this.id,
    this.name,
    this.avatar,
  });

  factory AuthorVideoPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthorVideoPayloadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorVideoPayloadDTOToJson(this);
}
