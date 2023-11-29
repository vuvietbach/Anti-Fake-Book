
import 'package:anti_fake_book/utils.dart';
part 'device.dto.g.dart';

@customJsonSerializable
class SetDevtokenResponse {
  final int code;
  final String message;
  SetDevtokenResponse({required this.code, required this.message});
  factory SetDevtokenResponse.fromJson(Map<String, dynamic> json) =>
      _$SetDevtokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SetDevtokenResponseToJson(this);
}