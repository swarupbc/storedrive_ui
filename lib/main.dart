import 'package:flutter/material.dart';
import 'package:storedrive_ui/views/login/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StoreDrive',
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
