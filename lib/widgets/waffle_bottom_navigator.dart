import 'package:flutter/material.dart';
import 'package:waffle/screens/manage.dart';
import 'package:waffle/screens/status.dart';
import 'package:waffle/widgets/waffle_appbar.dart';
import 'package:waffle/styles/palette.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreen();
}

class _BottomNavigationScreen extends State<BottomNavigationScreen> {
  static List<Widget> _widgetOptions = [ManageScreen(), StatusScreen()];

  int _selectedIndex = 0;
  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.lightGrey,
      appBar: WaffleAppBar(),
      body: _widgetOptions[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        splashColor: Palette.mimosa,
        backgroundColor: Palette.darkGrey,
        elevation: 2.0,
        onPressed: () {
          showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                    backgroundColor: Palette.lightGrey,
                    content: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(children: [
                        //MARK: MEMBER LIST SELECTOR, PUSH TO DATA BUTTON, CANCEL BUTTON
                      ]),
                    ));
              }));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Palette.darkGrey,
        selectedItemColor: Palette.mimosa,
        unselectedItemColor: Palette.tickGrey,
        onTap: _onTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: '관리'),
        ],
      ),
    );
  }
}
