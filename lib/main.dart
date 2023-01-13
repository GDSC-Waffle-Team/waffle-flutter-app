import 'package:flutter/material.dart';
import 'package:waffle/screens/edit.dart';
import 'package:waffle/screens/login.dart';
import 'package:waffle/screens/member.dart';
import 'package:waffle/screens/member_list.dart';
import 'package:waffle/widgets/waffle_bottom_navigator.dart';

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
          fontFamily: "NotoSans"),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginScreen(),
        "/navigator": (context) => BottomNavigationScreen(),
        "/member": (context) => MemberScreen(),
        "/list": (context) => MemberListScreen(),
        "/edit": (context) => MemberEditScreen(),
      },
    );
  }
}
