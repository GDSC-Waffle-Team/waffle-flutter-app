import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

//MARK: SKELETON SCREEN
class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  var lateness = 3;
  var absent = 0;
  var other = 0;
  var nextFine = 1000;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.lightGrey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 55.0),
            child: Center(
              child: Container(
                height: _height * 0.3,
                width: _width * 0.9,
                decoration: BoxDecoration(
                    color: Palette.darkGrey,
                    border: Border.all(color: Palette.darkGrey),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Palette.tickGrey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 15,
                          offset: Offset.zero)
                    ]),
              ),
            ),
          ),
          const Divider(
            color: Palette.tickGrey,
            indent: 20.0,
            endIndent: 20.0,
          ),
          Spacer(),
          Container(
            height: _height * 0.12,
            width: _width * 1,
            decoration: BoxDecoration(
                color: Palette.darkGrey,
                border: Border.all(color: Palette.darkGrey),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                      color: Palette.tickGrey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 15,
                      offset: Offset.zero)
                ]),
            child: GestureDetector(onTap: () {
              showModalBottomSheet(
                  backgroundColor: Palette.darkGrey,
                  context: context,
                  isDismissible: false,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  builder: ((context) {
                    return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        height: _height * 0.5,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                height: _height * 0.009,
                                width: _width * 0.1,
                                decoration: BoxDecoration(
                                  color: Palette.tickGrey,
                                  border: Border.all(color: Palette.darkGrey),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 35.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "지각",
                                    style: TextStyle(
                                        color: Palette.mimosa, fontSize: 25),
                                  ),
                                  Text(
                                    "결석",
                                    style: TextStyle(
                                        color: Palette.mimosa, fontSize: 25),
                                  ),
                                  Text(
                                    "기타",
                                    style: TextStyle(
                                        color: Palette.mimosa, fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 45.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$lateness",
                                    style: TextStyle(
                                        color: Palette.mimosa, fontSize: 35),
                                  ),
                                  Text(
                                    "$absent",
                                    style: TextStyle(
                                        color: Palette.mimosa, fontSize: 35),
                                  ),
                                  Text(
                                    "$other",
                                    style: TextStyle(
                                        color: Palette.mimosa, fontSize: 35),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 35.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "다음 예상 납부 금액은..",
                                          style: TextStyle(
                                              color: Palette.mimosa,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          "$nextFine원",
                                          style: TextStyle(
                                              color: Palette.mimosa,
                                              fontSize: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                  }));
            }),
          )
        ],
      ),
    );
  }
}
