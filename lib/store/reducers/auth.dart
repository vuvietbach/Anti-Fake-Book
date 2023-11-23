import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/state/index.dart';

AntiFakeBookState onSignInSuccess(
    AntiFakeBookState state, SuccessSignInAction action) {
  Map<String, dynamic> data = state.toJson();
}