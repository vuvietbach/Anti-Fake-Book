import 'dart:typed_data';
import 'package:anti_fake_book/utils.dart';
part 'add_post.dto.g.dart';

@customJsonSerializable
class AddPostRequestDTO {
  List<Uint8List> image = [];
  List<Uint8List> video = [];
  String described = '';
  String status = '';
  AddPostRequestDTO();
  factory AddPostRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$AddPostRequestDTOFromJson(json);
  Map<String, dynamic> toJson() => _$AddPostRequestDTOToJson(this);
}
