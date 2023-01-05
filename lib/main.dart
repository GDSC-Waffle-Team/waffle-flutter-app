import 'package:flutter/material.dart';
import 'package:waffle/screens/login.dart';

//MARK: ROOT WIDGET
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waffle',
      theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          fontFamily: "NotoSansKR"),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
