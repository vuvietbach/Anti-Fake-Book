import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class SignUpState {
  late String password;
  late String email;
  SignUpState() {
    password = "";
    email = "";
  }
  void reset() {
    password = "";
    email = "";
  }
}

final signUpStateProvider = Provider<SignUpState>((ref) => SignUpState());
