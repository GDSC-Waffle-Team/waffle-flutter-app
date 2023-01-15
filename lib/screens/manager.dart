import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:waffle/providers/fine_list.dart';
import 'package:waffle/utilities/converter.dart';
import 'package:waffle/utilities/services.dart';
import 'package:waffle/widgets/waffle_appbar.dart';
import 'package:waffle/styles/palette.dart';
import 'package:waffle/widgets/waffle_badge.dart';
import 'package:waffle/widgets/waffle_indicator.dart';
import 'package:waffle/widgets/waffle_logout_button.dart';
import 'package:waffle/widgets/waffle_notificator.dart';
import 'package:waffle/widgets/waffle_poplocker.dart';

class ManageScreen extends StatefulWidget {
  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  HttpServices httpServices = HttpServices();
  Converters converters = Converters();
  late Future<FineList> _getMembers = httpServices.getRecent();
  final secureStorage = FlutterSecureStorage();
  static const ROLES = "GDSC";
  static const NICKNAME = "관리자";

  @override
  void initState() {
    super.initState();
    _getMembers;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final secureStorage = FlutterSecureStorage();
    return WafflePopLocker(
      child: Scaffold(
        appBar: WaffleAppBar(),
        backgroundColor: Palette.lightGrey,
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _getMembers;
            });
            await Future.delayed(Duration(milliseconds: 1000));
          },
          backgroundColor: Palette.darkGrey,
          color: Palette.mimosa,
          child: SafeArea(
            child: Container(
                height: _height * 1,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: FutureBuilder(
                        future: _getMembers,
                        builder: ((BuildContext context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            int notpays = 0;
                            int pays = 0;
                            int totals = 0;
                            int index = 0;
                            var fines = snapshot.data!.fineList;
                            var dataLength = fines!.length;
                            for (index; index < dataLength; index++) {
                              if (fines[index].status == false) {
                                notpays++;
                                totals++;
                              } else if (fines[index].status == true) {
                                pays++;
                                totals++;
                              }
                            }
                            return Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25.0, top: 25.0),
                                              child: Text("$ROLES",
                                                  style: TextStyle(
                                                      color: Palette.tickGrey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25.0, top: 5.0),
                                              child: Text("$NICKNAME",
                                                  style: TextStyle(
                                                      color: Palette.tickGrey,
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w700)),
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
                                                                    FontWeight
                                                                        .w500)),
                                                        content_text: Text(
                                                            "계정 정보를 삭제하고 로그인 화면으로 돌아갑니다.",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context,
                                                                    "/navigator");
                                                              },
                                                              child: Text("취소"),
                                                              style: TextButton
                                                                  .styleFrom(
                                                                      foregroundColor:
                                                                          Palette
                                                                              .lightMagenta)),
                                                          TextButton(
                                                              onPressed:
                                                                  () async {
                                                                await secureStorage
                                                                    .delete(
                                                                        key:
                                                                            "loginKey");
                                                                Navigator
                                                                    .pushNamed(
                                                                        context,
                                                                        "/login");
                                                              },
                                                              child: Text("확인"),
                                                              style: TextButton
                                                                  .styleFrom(
                                                                      foregroundColor:
                                                                          Palette
                                                                              .tickGrey))
                                                        ]);
                                                  });
                                            },
                                          )
                                        ],
                                      )
                                    ]),
                                WaffleManagerBadge(
                                    pays: pays,
                                    notpays: notpays,
                                    totals: totals),
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
                                    width: _width * 0.85,
                                    child: ListView.builder(
                                        reverse: true,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            snapshot.data!.fineList!.length,
                                        itemBuilder: (((context, index) {
                                          var fines = snapshot.data!.fineList;
                                          var id = fines![index].id;
                                          var memberId = fines[index].memberId;
                                          var type = fines[index].type;
                                          var status =
                                              fines[index].status.toString();
                                          if (type == "00") {
                                            type = "지각";
                                          } else if (type == "01") {
                                            type = "결석";
                                          } else {
                                            type = "과제";
                                          }
                                          if (status == "false") {
                                            status = "미납부중";
                                          } else {
                                            status = "납부완료";
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
                                                      Text("$id",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .darkGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 17)),
                                                      Text(
                                                          converters
                                                              .memberIdConverter(
                                                                  memberId),
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .darkGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 17)),
                                                      Text("$type",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .darkGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 17)),
                                                      Text("$status",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .darkGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 17))
                                                    ])),
                                          );
                                        }))),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return WaffleCircularIndicator();
                          }
                        })))),
          ),
        ),
      ),
    );
  }
}
