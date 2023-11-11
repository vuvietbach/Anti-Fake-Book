import 'package:anti_fake_book/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthenticationState extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  Future signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      notifyListeners();
    } on FirebaseAuthException {
      rethrow;
    }
  }
  Future signOut() async {
    try {
      await _auth.signOut();
      _user = null;
      notifyListeners();
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
