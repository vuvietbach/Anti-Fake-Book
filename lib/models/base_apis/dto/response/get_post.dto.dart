import 'dart:typed_data';

import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_post.dto.g.dart';
part 'get_post.dto.freezed.dart';

@unfreezed
class GetPostResponseDTO with _$GetPostResponseDTO {
  @customJsonSerializable
  factory GetPostResponseDTO({
    required PostPayloadDTO data,
  }) = _GetPostResponseDTO;

  factory GetPostResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$GetPostResponseDTOFromJson(json);
}

@freezed
class PostPayloadDTO with _$PostPayloadDTO {
  @customJsonSerializable
  const factory PostPayloadDTO({
    String? id,
    String? name,
    DateTime? created,
    @Default('') String described,
    DateTime? modified,
    int? fake,
    int? trust,
    int? kudos,
    int? disappointed,
    bool? isRated,
    bool? isMarked,
    @Default([]) List<ImagePayloadDTO> images,
    @Default([]) List<VideoPayloadDTO> video,
    AuthorPostPayloadDTO? author,
    PostCategory? category,
    int? state,
    bool? isBlock,
    bool? canEdit,
    bool? banned,
    int? canMark,
    int? canRate,
    String? url,
    String? messages,
    String? status,
  }) = _PostPayloadDTO;

  factory PostPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$PostPayloadDTOFromJson(json);
}

@unfreezed
class PostCategory with _$PostCategory {
  @customJsonSerializable
  factory PostCategory({
    String? id,
    String? name,
    String? hasName,
  }) = _PostCategory;

  factory PostCategory.fromJson(Map<String, dynamic> json) =>
      _$PostCategoryFromJson(json);
}

@unfreezed
class AuthorPostPayloadDTO with _$AuthorPostPayloadDTO {
  @customJsonSerializable
  factory AuthorPostPayloadDTO({
    required List<String> listing,
    required String id,
    required String name,
    required int coins,
  }) = _AuthorPostPayloadDTO;

  factory AuthorPostPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthorPostPayloadDTOFromJson(json);
}

@unfreezed
class ImagePayloadDTO with _$ImagePayloadDTO {
  @customJsonSerializable
  factory ImagePayloadDTO({
    required String id,
    required String url,
    Uint8List? bytes,
  }) = _ImagePayloadDTO;

  factory ImagePayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$ImagePayloadDTOFromJson(json);
}

@unfreezed
class VideoPayloadDTO with _$VideoPayloadDTO {
  @customJsonSerializable
  factory VideoPayloadDTO({
    required String id,
    required String url,
    required String thumb,
  }) = _VideoPayloadDTO;

  factory VideoPayloadDTO.fromJson(Map<String, dynamic> json) =>
      _$VideoPayloadDTOFromJson(json);
}
