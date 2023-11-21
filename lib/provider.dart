


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
class Todo {
  final String description;
  final bool completed;

  Todo({
    required this.description,
    this.completed = false,
  });
}




final signUpStateProvider = Provider<SignUpState>((ref) => SignUpState());

