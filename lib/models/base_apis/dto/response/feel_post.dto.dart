import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/utils.dart';
part 'feel_post.dto.g.dart';

@customJsonSerializable
class FeelPostResponseDto extends ResponseDTO {
  FeelPostDataDto data = FeelPostDataDto();
  FeelPostResponseDto();
  factory FeelPostResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FeelPostResponseDtoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FeelPostResponseDtoToJson(this);
}

@customJsonSerializable
class FeelPostDataDto {
  int disapointed = 0;
  int kudos = 0;
  FeelPostDataDto();
  factory FeelPostDataDto.fromJson(Map<String, dynamic> json) =>
      _$FeelPostDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FeelPostDataDtoToJson(this);
}
