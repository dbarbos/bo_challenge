import 'package:boti_challenge/domain/custom_themes.dart';
import 'package:boti_challenge/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'oBoticário',
      theme: CustomThemes.mainTheme(),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
