import 'dart:typed_data';
import 'package:anti_fake_book/utils.dart';
part 'edit_post.dto.g.dart';

@customJsonSerializable
class EditPostRequestDto {
  EditPostRequestDto();
  String id = '';
  String? described;
  String? status;
  Uint8List? image;
  List<String>? imageDel;
  List<String>? imageSort;
  Uint8List? video;
  int? autoAccept;
  factory EditPostRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EditPostRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EditPostRequestDtoToJson(this);
}
