import 'package:anti_fake_book/models/base_apis/dto/response/user_info.dto.dart';

void main() {
  final userInfo = {
    "created": "3",
    "description": "4",
    "avatar": "5",
    "cover_image": "6",
    "link": "7",
    "address": "8",
    "city": "9",
    "country": "10",
    "listing": 11,
    "is_friend": 12,
    "online": 13,
    "coins": 14,
  };
  final userInfoData = UserInfoData.fromJson(userInfo);
  print(userInfoData);
}
