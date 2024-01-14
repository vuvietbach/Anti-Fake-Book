import 'package:anti_fake_book/models/base_apis/dto/response/get_push_settings.dto.dart';
import 'package:anti_fake_book/utils.dart';
part 'set_push_settings.dto.g.dart';

@customJsonSerializable
class SetPushSettingRequest extends GetPushSettingResponseDataDto {
  SetPushSettingRequest() : super();
  factory SetPushSettingRequest.fromJson(Map<String, dynamic> json) =>
      _$SetPushSettingRequestFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SetPushSettingRequestToJson(this);
}
