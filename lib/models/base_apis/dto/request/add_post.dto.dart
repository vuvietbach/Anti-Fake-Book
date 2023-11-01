import 'dart:io';

class AddPostRequestDTO {
  List<File> image;
  List<File> video;
  String described;
  String status;
  AddPostRequestDTO(
      {this.image = const [],
      this.video = const [],
      this.described = '',
      this.status = ''});
}
