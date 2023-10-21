import 'SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MaterialApp(localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,

  ], supportedLocales: const [
    Locale('en', ''),
    Locale('vi', ''), // Vietnamese locale
  ], debugShowCheckedModeBanner: false, home: const SignUp()));
}
