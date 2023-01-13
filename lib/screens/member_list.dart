import 'package:flutter/material.dart';
import 'package:waffle/providers/members_list.dart';
import 'package:waffle/styles/palette.dart';
import 'package:waffle/utilities/services.dart';
import 'package:waffle/widgets/waffle_indicator.dart';
import 'package:waffle/widgets/waffle_poplocker.dart';
import 'package:waffle/widgets/waffle_tabbar.dart';

class MemberListScreen extends StatefulWidget {
  const MemberListScreen({super.key});

  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  HttpServices httpServices = HttpServices();
  late Future<MembersList> _getMembers = httpServices.getMembers();

  @override
  void initState() {
    super.initState();
    _getMembers;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return WafflePopLocker(
      child: Scaffold(
        backgroundColor: Palette.lightGrey,
        appBar: PreferredSize(
          preferredSize: Size(0.0, 70.0),
          child: AppBar(
              title: const Text("멤버 리스트",
                  style: TextStyle(
                      color: Palette.tickGrey,
                      fontSize: 30,
                      fontWeight: FontWeight.w700)),
              backgroundColor: Palette.lightGrey,
              centerTitle: false,
              foregroundColor: Palette.lightGrey,
              surfaceTintColor: Palette.lightGrey,
              scrolledUnderElevation: 2.0,
              elevation: 0.0,
              primary: false,
              automaticallyImplyLeading: false),
        ),
        body: SafeArea(
            child: DefaultTabController(
          length: 3,
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 1000));
              setState(() {
                _getMembers;
              });
            },
            backgroundColor: Palette.darkGrey,
            color: Palette.mimosa,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: _height * 1.2,
                child: FutureBuilder(
                    future: _getMembers,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: WaffleTabBar(tabs: [
                                Container(child: const Text("웹")),
                                Container(child: const Text("백엔드")),
                                Container(child: const Text("모바일"))
                              ]),
                            ),
                            Container(
                                height: _height * 1.1,
                                child: TabBarView(children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          snapshot.data!.membersData.length,
                                      itemBuilder: ((context, index) {
                                        var data =
                                            snapshot.data!.membersData[index];
                                        if (data.part == "Web") {
                                          var nickname = data.nickname;
                                          var memberId = data.memberId;
                                          return Column(children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Container(
                                                width: _width * 0.92,
                                                height: _height * 0.07,
                                                decoration: BoxDecoration(
                                                    color: Palette.lightGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Palette
                                                              .tickGrey
                                                              .withOpacity(0.3),
                                                          spreadRadius: 3,
                                                          blurRadius: 15,
                                                          offset: Offset.zero)
                                                    ]),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0),
                                                      child: Text("$nickname",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .darkGrey,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                              context, "/edit",
                                                              arguments:
                                                                  memberId);
                                                        },
                                                        icon: Icon(Icons.edit,
                                                            color: Palette
                                                                .tickGrey))
                                                  ],
                                                ),
                                              ),
                                            )
                                          ]);
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                      })),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          snapshot.data!.membersData.length,
                                      itemBuilder: ((context, index) {
                                        var data =
                                            snapshot.data!.membersData[index];
                                        if (data.part == "Backend") {
                                          var nickname = data.nickname;
                                          var memberId = data.memberId;
                                          return Column(children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Container(
                                                width: _width * 0.92,
                                                height: _height * 0.07,
                                                decoration: BoxDecoration(
                                                    color: Palette.lightGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Palette
                                                              .tickGrey
                                                              .withOpacity(0.3),
                                                          spreadRadius: 3,
                                                          blurRadius: 15,
                                                          offset: Offset.zero)
                                                    ]),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0),
                                                      child: Text("$nickname",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .darkGrey,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                              context, "/edit",
                                                              arguments:
                                                                  memberId);
                                                        },
                                                        icon: Icon(Icons.edit,
                                                            color: Palette
                                                                .tickGrey))
                                                  ],
                                                ),
                                              ),
                                            )
                                          ]);
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                      })),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          snapshot.data!.membersData.length,
                                      itemBuilder: ((context, index) {
                                        var data =
                                            snapshot.data!.membersData[index];
                                        if (data.part == "Mobile") {
                                          var nickname = data.nickname;
                                          var memberId = data.memberId;
                                          return Column(children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Container(
                                                width: _width * 0.92,
                                                height: _height * 0.07,
                                                decoration: BoxDecoration(
                                                    color: Palette.lightGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Palette
                                                              .tickGrey
                                                              .withOpacity(0.3),
                                                          spreadRadius: 3,
                                                          blurRadius: 15,
                                                          offset: Offset.zero)
                                                    ]),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0),
                                                      child: Text("$nickname",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .darkGrey,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                              context, "/edit",
                                                              arguments:
                                                                  memberId);
                                                        },
                                                        icon: Icon(Icons.edit,
                                                            color: Palette
                                                                .tickGrey))
                                                  ],
                                                ),
                                              ),
                                            )
                                          ]);
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                      })),
                                ]))
                          ],
                        );
                      } else {
                        return Container(
                          height: _height * 0.7,
                          child: Stack(
                              alignment: Alignment.center,
                              children: [WaffleCircularIndicator()]),
                        );
                      }
                    }),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
