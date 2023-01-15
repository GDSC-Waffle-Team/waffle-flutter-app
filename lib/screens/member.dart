import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:waffle/providers/member_data.dart';
import 'package:waffle/styles/palette.dart';
import 'package:waffle/utilities/services.dart';
import 'package:waffle/widgets/waffle_appbar.dart';
import 'package:waffle/widgets/waffle_badge.dart';
import 'package:waffle/widgets/waffle_logout_button.dart';
import 'package:waffle/widgets/waffle_notificator.dart';
import 'package:waffle/widgets/waffle_poplocker.dart';

class MemberScreen extends StatefulWidget {
  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  HttpServices httpServices = HttpServices();
  late Future<MemberData> _getFines = httpServices.getFines();
  String roles = "멤버";

  @override
  void initState() {
    super.initState();
    _getFines;
  }

  @override
  void dispose() {
    _getFines;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return WafflePopLocker(
      child: Scaffold(
          backgroundColor: Palette.lightGrey,
          appBar: WaffleAppBar(),
          body: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 1000));
              setState(() {
                _getFines;
              });
            },
            backgroundColor: Palette.darkGrey,
            color: Palette.mimosa,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FutureBuilder(
                  future: _getFines,
                  builder: ((BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var nickname = snapshot.data!.nickname;
                      int totals = 0;
                      int lates = 0;
                      int absents = 0;
                      int nones = 0;
                      var dataLength = snapshot.data!.fines!.length;
                      var data = snapshot.data!.fines;
                      int index = 0;
                      for (index; index < dataLength; index++) {
                        if (data![index].type == "00") {
                          lates++;
                          totals = totals * 2;
                        } else if (data[index].type == "01") {
                          absents++;
                        } else if (data[index].type == "10") {
                          nones++;
                        }
                      }
                      int pays = lates + nones;
                      num temp = 2;
                      if (lates == 3) {
                        lates = 0;
                        absents++;
                      }
                      for (num i = 0; i < pays; i++) {
                        totals += 1000 * math.pow(temp, i).toInt();
                      }
                      if (lates == 0 && nones == 0) {
                        totals = 0;
                      }
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0, right: 20.0),
                                    child: Text("$roles",
                                        style: TextStyle(
                                            color: Palette.tickGrey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, top: 5.0),
                                    child: Text("$nickname",
                                        style: TextStyle(
                                            color: Palette.tickGrey,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ],
                              ),
                              WaffleLogoutButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return WaffleNotificator(
                                            text: Text("로그아웃",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            content_text: Text(
                                                "기존 계정 정보를 삭제하고 로그인 화면으로 돌아갑니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, "/member");
                                                  },
                                                  child: Text("취소"),
                                                  style: TextButton.styleFrom(
                                                      foregroundColor: Palette
                                                          .lightMagenta)),
                                              TextButton(
                                                  onPressed: () async {
                                                    final secureStorage =
                                                        FlutterSecureStorage();
                                                    await secureStorage.delete(
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
                          ),
                          WaffleMemberBadge(
                            totals: totals,
                            lates: lates,
                            absents: absents,
                          ),
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
                          Center(
                            child: Container(
                              height: _height * 0.5,
                              width: _width * 0.85,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data?.fines?.length,
                                  itemBuilder: (((context, index) {
                                    var data = snapshot.data?.fines?[index];
                                    var date = data?.date;
                                    var type = data?.type;
                                    var status = data?.status.toString();
                                    if (status == "false") {
                                      status = "미납부중";
                                    } else if (status == "true") {
                                      status = "납부완료";
                                    }
                                    if (type == "00") {
                                      type = "지각";
                                    } else if (type == "01") {
                                      type = "결석";
                                      absents += 1;
                                    } else if (type == "10") {
                                      type = "과제";
                                    }

                                    if (type == "지각" && status == "미납부중") {
                                      lates += 1;
                                      if (lates == 3) {
                                        absents += 1;
                                      }
                                    } else if (type == "과제" &&
                                        status == "미납부중") {
                                      nones += 1;
                                    }

                                    return Container(
                                      child: Card(
                                          elevation: 0,
                                          color: Palette.lightGrey,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("$date",
                                                    style: TextStyle(
                                                        color: Palette.darkGrey,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 17)),
                                                Text("$type",
                                                    style: TextStyle(
                                                        color: Palette.darkGrey,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 17)),
                                                Text("$status",
                                                    style: TextStyle(
                                                        color: Palette.darkGrey,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 17))
                                              ])),
                                    );
                                  }))),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                              color: Palette.darkGrey));
                    }
                  })),
            ),
          )),
    );
  }
}
