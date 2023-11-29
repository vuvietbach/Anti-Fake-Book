import 'package:anti_fake_book/utils.dart';
part 'user_info.dto.g.dart';

@customJsonSerializable
class SetUserInfoResponse {
  final int code;
  final String message;

  SetUserInfoResponse({required this.code, required this.message});
  factory SetUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$SetUserInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SetUserInfoResponseToJson(this);
}