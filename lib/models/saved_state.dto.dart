import 'package:anti_fake_book/utils.dart';

part 'saved_state.dto.g.dart';

@customJsonSerializable
class SavedState {
  final String token;
  final String username;
  final String email;
  SavedState({this.token = "", this.email = "", this.username = ""});
  factory SavedState.fromJson(Map<String, dynamic> json) =>
      _$SavedStateFromJson(json);
  Map<String, dynamic> toJson() => _$SavedStateToJson(this);
}

void main() {
  var savedState = SavedState.fromJson({"token": "hello"});
  print(savedState.toJson());
}
