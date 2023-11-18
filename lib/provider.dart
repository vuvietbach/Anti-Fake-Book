

import 'package:anti_fake_book/data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpState {
  late String password;
  late String email;

}

final signInStateProvider = Provider<SignInState>((ref) => SignInState());
final signUpStateProvider = Provider<SignUpState>((ref) => SignUpState());