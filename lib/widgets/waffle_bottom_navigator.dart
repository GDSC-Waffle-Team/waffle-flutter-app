import 'package:flutter/material.dart';
import 'package:waffle/screens/manager.dart';
import 'package:waffle/screens/member_list.dart';
import 'package:waffle/utilities/services.dart';
import 'package:waffle/styles/palette.dart';
import 'package:waffle/widgets/waffle_appbar.dart';
import 'package:waffle/widgets/waffle_poplocker.dart';
import 'package:waffle/widgets/waffle_quick_field.dart';
import 'package:waffle/widgets/waffle_quicker.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreen();
}

class _BottomNavigationScreen extends State<BottomNavigationScreen> {
  HttpServices httpServices = HttpServices();
  var nicknameContorller = TextEditingController();
  var dateController = TextEditingController();
  var typeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static List<Widget> _widgetOptions = [ManageScreen(), MemberListScreen()];

  int _selectedIndex = 0;
  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    httpServices.createFines;
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return WafflePopLocker(
      child: Scaffold(
        backgroundColor: Palette.lightGrey,
        appBar: PreferredSize(
          preferredSize: Size(0.0, 20.0),
          child: WaffleAppBar(),
        ),
        body: _widgetOptions[_selectedIndex],
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: WaffleQuicker(
            onPressed: (() {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        backgroundColor: Palette.lightGrey,
                        title: const Text("빠른 추가",
                            style: TextStyle(
                                color: Palette.tickGrey,
                                fontSize: 25,
                                fontWeight: FontWeight.w700)),
                        content: Container(
                            height: _height * 0.32,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  WaffleQuickField(
                                      textInputAction: TextInputAction.next,
                                      controller: nicknameContorller,
                                      hintText: "이름"),
                                  WaffleQuickField(
                                      textInputAction: TextInputAction.next,
                                      controller: dateController,
                                      hintText: "날짜(ex. yyyy-mm-dd)"),
                                  WaffleQuickField(
                                      textInputAction: TextInputAction.done,
                                      controller: typeController,
                                      hintText: "종류(ex. 지각 또는 미제출)"),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: TextButton(
                                        onPressed: () async {
                                          if (await httpServices.createFines(
                                                  nicknameContorller.text,
                                                  dateController.text,
                                                  typeController.text) ==
                                              true) {
                                            showDialog(
                                                context: context,
                                                builder: ((context) {
                                                  return AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero),
                                                      title: const Text("성공",
                                                          style: TextStyle()),
                                                      content: const Text(
                                                          "입력하신 내역을 추가했어요!",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .darkGrey)));
                                                }));
                                          } else if (await httpServices
                                                  .createFines(
                                                      nicknameContorller.text,
                                                      dateController.text,
                                                      typeController.text) ==
                                              false) {
                                            showDialog(
                                                context: context,
                                                builder: ((context) {
                                                  return AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero),
                                                      title: const Text("실패",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .tickGrey,
                                                              fontSize: 20)),
                                                      content: const Text(
                                                          "내역에 필요한 값을 다시 입력해주세요.",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .lightMagenta)));
                                                }));
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            backgroundColor: Palette.darkGrey,
                                            surfaceTintColor: Palette.lightGrey,
                                            foregroundColor: Palette.mimosa),
                                        child: Text("저장",
                                            style: TextStyle(
                                                color: Palette.mimosa,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700))),
                                  ),
                                ],
                              ),
                            ),
                            decoration:
                                BoxDecoration(color: Palette.lightGrey)));
                  });
            }),
            icon: Icon(Icons.add, color: Palette.mimosa)),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Palette.darkGrey,
          selectedItemColor: Palette.lightGrey,
          unselectedItemColor: Palette.tickGrey,
          onTap: _onTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: '관리'),
          ],
        ),
      ),
    );
  }
}
