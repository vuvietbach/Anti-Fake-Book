import 'package:json_annotation/json_annotation.dart';
import 'package:anti_fake_book/utils.dart';
part 'user.g.dart';
@customJsonSerializable
class UserState {
  String avatar =
      'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg';
  String username = 'Nguyen Minh Tuan';
  int coins = 0;
  UserState.initState();
  UserState({required this.avatar, required this.username, required this.coins});
}
