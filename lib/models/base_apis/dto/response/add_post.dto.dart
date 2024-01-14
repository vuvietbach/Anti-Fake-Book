import 'package:anti_fake_book/utils.dart';

import 'response.dto.dart';
part 'add_post.dto.g.dart';

@customJsonSerializable
class AddPostResponseDTO extends ResponseDTO {
  DataAddPostResponse? data;
  AddPostResponseDTO(this.data) : super();
  factory AddPostResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$AddPostResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$AddPostResponseDTOToJson(this);
}

@customJsonSerializable
class DataAddPostResponse {
  String id;
  String url;
  int coins;
  DataAddPostResponse(this.id, this.url, this.coins);
  factory DataAddPostResponse.fromJson(Map<String, dynamic> json) =>
      _$DataAddPostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataAddPostResponseToJson(this);
}
