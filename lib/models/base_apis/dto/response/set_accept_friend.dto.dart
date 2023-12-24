import 'package:anti_fake_book/utils.dart';

part 'set_accept_friend.dto.g.dart';

@customJsonSerializable
class SetAcceptFriendResponseDTO {
  final String? code;
  final String? message;

  SetAcceptFriendResponseDTO({
    required this.code,
    required this.message,
  });

  factory SetAcceptFriendResponseDTO.fromJson(Map<String, dynamic> json) {
    return _$SetAcceptFriendResponseDTOFromJson(json);
  }
}
