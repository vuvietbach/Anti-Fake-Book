
import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@unfreezed
class UserState with _$UserState {
  @customJsonSerializable
  factory UserState({
    @Default(
        'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg')
    String avatar,
    @Default('Nguyen Minh Tuan') String username,
    @Default(0) int coins,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}

void main() {
  final user = UserState();
  print(user.copyWith(coins: 10));
}
