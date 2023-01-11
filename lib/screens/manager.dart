import 'package:flutter/material.dart';
import 'package:waffle/providers/manager_data.dart';
import 'package:waffle/utilities/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:waffle/widgets/waffle_appbar.dart';
import 'package:waffle/styles/palette.dart';
import 'package:waffle/widgets/waffle_badge.dart';
import 'package:waffle/widgets/waffle_logout_button.dart';
import 'package:waffle/widgets/waffle_notificator.dart';
import 'package:waffle/widgets/waffle_poplocker.dart';

class ManageScreen extends StatefulWidget {
  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  HttpServices httpServices = HttpServices();
  late Future<MembersData> _getMembers = httpServices.getMembers();
  final secureStorage = FlutterSecureStorage();
  static const ROLES = "GDSC";
  static const NICKNAME = "관리자";

  @override
  void initState() {
    super.initState();
  }

  /*
  @override
  void dispose() {
    _getMembers;
    super.dispose();
  }
  */
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final secureStorage = FlutterSecureStorage();
    final amount = 0;
    return WafflePopLocker(
      child: Scaffold(
        appBar: WaffleAppBar(),
        backgroundColor: Palette.lightGrey,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, top: 25.0),
                                    child: Text("$ROLES",
                                        style: TextStyle(
                                            color: Palette.tickGrey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, top: 5.0),
                                    child: Text("$NICKNAME",
                                        style: TextStyle(
                                            color: Palette.tickGrey,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700)),
                                  )
                                ]),
                            Column(
                              children: [
                                WaffleLogoutButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return WaffleNotificator(
                                              text: Text("로그아웃",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                              content_text: Text(
                                                  "계정 정보를 삭제하고 로그인 화면으로 돌아갑니다.",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context,
                                                          "/navigator");
                                                    },
                                                    child: Text("취소"),
                                                    style: TextButton.styleFrom(
                                                        foregroundColor:
                                                            Palette.darkGrey)),
                                                TextButton(
                                                    onPressed: () async {
                                                      await secureStorage
                                                          .delete(
                                                              key: "loginKey");
                                                      Navigator.pushNamed(
                                                          context, "/login");
                                                    },
                                                    child: Text("확인"),
                                                    style: TextButton.styleFrom(
                                                        foregroundColor:
                                                            Palette.tickGrey))
                                              ]);
                                        });
                                  },
                                )
                              ],
                            )
                          ]),
                      WaffleManagerBadge(amount: amount),
                      SizedBox(height: 20),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text("최근 기록",
                              style: TextStyle(
                                  color: Palette.tickGrey,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700)),
                        )
                      ]),
                      const Divider(
                        color: Palette.tickGrey,
                        indent: 25.0,
                        endIndent: 25.0,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
