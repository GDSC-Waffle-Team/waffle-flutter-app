import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class WaffleTabBar extends StatelessWidget {
  const WaffleTabBar({Key? key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        tabs: tabs,
        isScrollable: false,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Palette.darkGrey),
        indicatorColor: Palette.darkGrey,
        indicatorWeight: 2,
        labelColor: Palette.mimosa,
        labelPadding: const EdgeInsets.symmetric(vertical: 5.0),
        unselectedLabelColor: Palette.tickGrey,
        unselectedLabelStyle:
            const TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
        labelStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: Palette.mimosa,
        ));
  }
}
