import 'dart:typed_data';

class AddPostRequestDTO {
  List<Uint8List> image = [];
  List<Uint8List> video = [];
  String described = '';
  String status = '';
}
