import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class WaffleMemberBadge extends StatelessWidget {
  const WaffleMemberBadge(
      {Key? key,
      required this.totals,
      required this.lates,
      required this.absents});

  final int totals;
  final int lates;
  final int absents;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                children: [
                  const Text("납부 금액",
                      style: TextStyle(
                          color: Palette.mimosa,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                  Text("$totals 원",
                      style: TextStyle(
                          color: Palette.mimosa,
                          fontSize: 30,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Palette.tickGrey,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: const Text("결석",
                                  style: TextStyle(
                                      color: Palette.lightGrey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Text("$absents",
                                style: TextStyle(
                                    color: Palette.lightGrey,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text("지각",
                                style: TextStyle(
                                    color: Palette.lightGrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            Text("$lates",
                                style: TextStyle(
                                    color: Palette.lightGrey,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ])
                ],
              ),
            ),
            height: _height * 0.3,
            width: _width * 0.9,
            decoration: BoxDecoration(
                color: Palette.darkGrey,
                border: Border.all(color: Palette.darkGrey),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Palette.tickGrey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 15,
                      offset: Offset.zero)
                ])));
  }
}

class WaffleManagerBadge extends StatelessWidget {
  const WaffleManagerBadge(
      {Key? key,
      required this.notpays,
      required this.pays,
      required this.totals});

  final int notpays;
  final int pays;
  final int totals;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                children: [
                  const Text("종합 내역",
                      style: TextStyle(
                          color: Palette.mimosa,
                          fontSize: 25,
                          fontWeight: FontWeight.w700)),
                  Text("$totals개",
                      style: TextStyle(
                          color: Palette.mimosa,
                          fontSize: 30,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Palette.tickGrey,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: const Text("납부",
                                  style: TextStyle(
                                      color: Palette.lightGrey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                            const SizedBox(height: 10),
                            Text("$pays개",
                                style: TextStyle(
                                    color: Palette.lightGrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text("미납부",
                                style: TextStyle(
                                    color: Palette.lightGrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(height: 10),
                            Text("$notpays개",
                                style: TextStyle(
                                    color: Palette.lightGrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ])
                ],
              ),
            ),
            height: _height * 0.3,
            width: _width * 0.9,
            decoration: BoxDecoration(
                color: Palette.darkGrey,
                border: Border.all(color: Palette.darkGrey),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Palette.tickGrey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 15,
                      offset: Offset.zero)
                ])));
  }
}
