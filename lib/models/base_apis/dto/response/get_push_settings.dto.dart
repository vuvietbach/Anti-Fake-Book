import 'package:anti_fake_book/models/base_apis/dto/response/response.dto.dart';
import 'package:anti_fake_book/utils.dart';
part 'get_push_settings.dto.g.dart';

@customJsonSerializable
class GetPushSettingResponseDto extends ResponseDTO {
  GetPushSettingResponseDataDto data = GetPushSettingResponseDataDto();
  GetPushSettingResponseDto();
  factory GetPushSettingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetPushSettingResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetPushSettingResponseDtoToJson(this);
}

@customJsonSerializable
class GetPushSettingResponseDataDto {
  bool likeComment = true;
  bool fromFriend = true;
  bool requestedFriend = true;
  bool suggestedFriend = true;
  bool birthday = true;
  bool video = true;
  bool report = true;
  bool soundOn = true;
  bool notificationOn = true;
  bool vibrantOn = true;
  bool ledOn = true;
  GetPushSettingResponseDataDto();
  factory GetPushSettingResponseDataDto.fromJson(Map<String, dynamic> json) =>
      _$GetPushSettingResponseDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetPushSettingResponseDataDtoToJson(this);
}
