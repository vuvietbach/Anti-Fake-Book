import 'package:anti_fake_book/HomePage.dart';
import 'package:anti_fake_book/test.dart';
import "SignIn.dart";
import 'SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MaterialApp(localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ], supportedLocales: [
    Locale('en', ''),
    Locale('vi', ''), // Vietnamese locale
  ], debugShowCheckedModeBanner: false, home: HomePage()));
}
