import 'package:flutter/material.dart';
import 'package:waffle/providers/fine_list.dart';
import 'package:waffle/styles/palette.dart';
import 'package:waffle/utilities/converter.dart';
import 'package:waffle/utilities/services.dart';
import 'package:waffle/widgets/waffle_indicator.dart';
import 'package:waffle/widgets/waffle_notificator.dart';

class MemberEditScreen extends StatefulWidget {
  const MemberEditScreen({Key? key});
  @override
  State<MemberEditScreen> createState() => _MemberEditScreenState();
}

class _MemberEditScreenState extends State<MemberEditScreen> {
  HttpServices httpServices = HttpServices();
  Converters converters = Converters();

  @override
  void initState() {
    super.initState();
    httpServices;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.width;
    final argument = ModalRoute.of(context)?.settings.arguments;
    String memberId = argument.toString();
    late Future<FineList> _edit = httpServices.getDetail(memberId);
    return Scaffold(
        backgroundColor: Palette.lightGrey,
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(Duration(milliseconds: 1000));
                    setState(() {
                      _edit;
                    });
                  },
                  backgroundColor: Palette.darkGrey,
                  color: Palette.mimosa,
                  child: Center(
                    child: Column(
                      children: [
                        FutureBuilder(
                            future: _edit,
                            builder: ((BuildContext context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 35.0),
                                  child: Container(
                                      width: _width * 0.9,
                                      height: _height * 1.5,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Text(
                                              converters
                                                  .memberIdConverter(memberId),
                                              style: TextStyle(
                                                  color: Palette.tickGrey,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: snapshot
                                                  .data!.fineList!.length,
                                              itemBuilder: (((context, index) {
                                                var data =
                                                    snapshot.data!.fineList;
                                                var id = data![index].id;
                                                var date = data[index].date;
                                                var type = data[index].type;
                                                var status = data[index]
                                                    .status
                                                    .toString();
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
                                                return Card(
                                                    elevation: 0,
                                                    color: Palette.lightGrey,
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("${index + 1}",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .darkGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize:
                                                                      17)),
                                                          Text("$date",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .darkGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize:
                                                                      17)),
                                                          Text("$type",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .darkGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize:
                                                                      17)),
                                                          ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              if (await httpServices
                                                                      .patchStatus(
                                                                          "$id",
                                                                          memberId) ==
                                                                  true) {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        ((context) {
                                                                      return AlertDialog(
                                                                          shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius
                                                                                  .zero),
                                                                          title: const Text(
                                                                              "성공",
                                                                              style:
                                                                                  TextStyle()),
                                                                          content: const Text(
                                                                              "납부 상태를 변경했어요!",
                                                                              style: TextStyle(color: Palette.darkGrey)));
                                                                    }));
                                                                setState(() {
                                                                  _edit;
                                                                });
                                                              } else {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        ((context) {
                                                                      return AlertDialog(
                                                                          shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius
                                                                                  .zero),
                                                                          title: const Text(
                                                                              "성공",
                                                                              style:
                                                                                  TextStyle()),
                                                                          content: const Text(
                                                                              "내역을 삭제하는데 실패했어요.",
                                                                              style: TextStyle(color: Palette.darkGrey)));
                                                                    }));
                                                              }
                                                            },
                                                            child:
                                                                Text("$status"),
                                                          ),
                                                          IconButton(
                                                              splashColor: Palette
                                                                  .lightMagenta,
                                                              onPressed:
                                                                  () async {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return WaffleNotificator(
                                                                          text: Text(
                                                                              "내역 삭제",
                                                                              style: TextStyle(fontWeight: FontWeight.w500)),
                                                                          content_text: Text("해당 내역을 삭제할까요?", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context, "/edit");
                                                                                },
                                                                                child: Text("취소"),
                                                                                style: TextButton.styleFrom(foregroundColor: Palette.lightMagenta)),
                                                                            TextButton(
                                                                                onPressed: () async {
                                                                                  if (await httpServices.deleteFines("$id", memberId) == true) {
                                                                                    showDialog(
                                                                                        context: context,
                                                                                        builder: ((context) {
                                                                                          return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero), title: const Text("성공"), content: const Text("내역을 성공적으로 삭제했어요!", style: TextStyle(color: Palette.darkGrey)));
                                                                                        }));
                                                                                    setState(() {
                                                                                      _edit;
                                                                                    });
                                                                                  } else {
                                                                                    showDialog(
                                                                                        context: context,
                                                                                        builder: ((context) {
                                                                                          return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero), title: const Text("성공"), content: const Text("내역을 삭제하는데 실패했어요.", style: TextStyle(color: Palette.darkGrey)));
                                                                                        }));
                                                                                  }
                                                                                },
                                                                                child: Text("확인"),
                                                                                style: TextButton.styleFrom(foregroundColor: Palette.tickGrey))
                                                                          ]);
                                                                    });
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .disabled_by_default_outlined,
                                                                color: Palette
                                                                    .lightMagenta,
                                                              )),
                                                        ]));
                                              }))),
                                          Spacer(),
                                          Center(
                                              child: TextButton(
                                                  child:
                                                      Text("닫기",
                                                          style:
                                                              TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700)),
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, "/list");
                                                  },
                                                  style: TextButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0)),
                                                      backgroundColor:
                                                          Palette.darkGrey,
                                                      surfaceTintColor:
                                                          Palette.lightGrey,
                                                      foregroundColor:
                                                          Palette.mimosa)))
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          color: Palette.lightGrey,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Palette.tickGrey
                                                    .withOpacity(0.3),
                                                spreadRadius: 3,
                                                blurRadius: 15,
                                                offset: Offset.zero)
                                          ])),
                                );
                              } else {
                                return Container(
                                  height: _height * 1.5,
                                  child:
                                      Center(child: WaffleCircularIndicator()),
                                );
                              }
                            })),
                        const SizedBox(height: 25.0),
                      ],
                    ),
                  ),
                ))));
  }
}
