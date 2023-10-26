import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/utils.dart';
part 'get_user_info.dto.g.dart';

@customJsonSerializable
class GetUserInfoResponseDTO extends ResponseDTO {
  UserInfoDTO data;
  GetUserInfoResponseDTO(this.data) : super();
  factory GetUserInfoResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserInfoResponseDTOToJson(this);
}

@customJsonSerializable
class UserInfoDTO {
  String id;
  String username;
  DateTime? created;
  String? description;
  String? avatar;
  String? coverImage;
  String? link;
  String? address;
  String? city;
  String? country;
  int? listing;
  bool? isFriend;
  bool? online;
  int? coins;
  UserInfoDTO({required this.id, required this.username});
  factory UserInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDTOFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoDTOToJson(this);
}
