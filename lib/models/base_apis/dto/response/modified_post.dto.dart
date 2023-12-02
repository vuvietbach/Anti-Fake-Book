import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/utils.dart';
part 'modified_post.dto.g.dart';

@customJsonSerializable
class ModifiedPostResponseDto extends ResponseDTO {
  final DataModifiedPostResponse data;
  ModifiedPostResponseDto(this.data);
  factory ModifiedPostResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ModifiedPostResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ModifiedPostResponseDtoToJson(this);
}

@customJsonSerializable
class DataModifiedPostResponse {
  int coins = 0;
  DataModifiedPostResponse(this.coins);
  factory DataModifiedPostResponse.fromJson(Map<String, dynamic> json) =>
      _$DataModifiedPostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataModifiedPostResponseToJson(this);
}
