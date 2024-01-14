import 'dart:typed_data';
import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_post.dto.freezed.dart';
part 'edit_post.dto.g.dart';

@freezed
class EditPostRequestDto with _$EditPostRequestDto {
  @customJsonSerializable
  factory EditPostRequestDto({
    String? id,
    String? described,
    String? status,
    @Default([]) List<Uint8List>? image,
    @Default([]) List<String>? imageDel,
    List<String>? imageSort,
    Uint8List? video,
    @Default("1") String? autoAccept,
  }) = _EditPostRequestDto;

  factory EditPostRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EditPostRequestDtoFromJson(json);
}
