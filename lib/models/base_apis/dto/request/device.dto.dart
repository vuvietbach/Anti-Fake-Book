import 'package:anti_fake_book/utils.dart';
part 'device.dto.g.dart';
@customJsonSerializable
class SetDevtokenRequest {
  final String token;
  final String devtype;
  final String devtoken;
  SetDevtokenRequest(
      {required this.token, required this.devtype, required this.devtoken});
  factory SetDevtokenRequest.fromJson(Map<String, dynamic> json) =>
      _$SetDevtokenRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SetDevtokenRequestToJson(this);
}
