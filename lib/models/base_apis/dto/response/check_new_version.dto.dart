import 'package:anti_fake_book/utils.dart';
part 'check_new_version.dto.g.dart';

@customJsonSerializable
class CheckNewVersionReponseDto {
  CheckNewVersionDataReponseDto data = CheckNewVersionDataReponseDto();
  CheckNewVersionReponseDto();
  factory CheckNewVersionReponseDto.fromJson(Map<String, dynamic> json) =>
      _$CheckNewVersionReponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CheckNewVersionReponseDtoToJson(this);
}

@customJsonSerializable
class CheckNewVersionDataReponseDto {
  _VersionInfo versionInfo = _VersionInfo();
  _UserInfo userInfo = _UserInfo();
  int badget = 0;
  int unreadMessage = 0;
  DateTime now = DateTime.now();
  CheckNewVersionDataReponseDto();
  factory CheckNewVersionDataReponseDto.fromJson(Map<String, dynamic> json) =>
      _$CheckNewVersionDataReponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CheckNewVersionDataReponseDtoToJson(this);
}

@customJsonSerializable
class _VersionInfo {
  String version = '1.0.0';
  String url = 'https://www.google.com';
  bool require = false;
  _VersionInfo();
  factory _VersionInfo.fromJson(Map<String, dynamic> json) =>
      _$VersionInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VersionInfoToJson(this);
}

@customJsonSerializable
class _UserInfo {
  String id = '1';
  bool active = true;
  _UserInfo();
  factory _UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
