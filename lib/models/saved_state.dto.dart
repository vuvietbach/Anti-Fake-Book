import 'package:anti_fake_book/store/state/user_info.dart';
import 'package:anti_fake_book/utils.dart';

part 'saved_state.dto.g.dart';

@customJsonSerializable
class SavedState {
  final String token;
  final UserInfo userInfo;
  SavedState({this.token = "", this.userInfo = const UserInfo()});
  factory SavedState.fromJson(Map<String, dynamic> json) =>
      _$SavedStateFromJson(json);
  Map<String, dynamic> toJson() => _$SavedStateToJson(this);
}

void main() {
  var savedState = SavedState.fromJson({"token": "hello"});
  print(savedState.toJson());
}
