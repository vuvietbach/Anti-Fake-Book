import 'package:anti_fake_book/models/base_apis/dto/response/get_user_info.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/response.dto.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SignInResponseDTO extends ResponseDTO{
  late UserInfoDTO data;
  SignInResponseDTO({required super.code, required super.message , data}) {
    this.data = UserInfoDTO.fromJson(data);
  }
}