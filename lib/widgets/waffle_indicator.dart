import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class WaffleCircularIndicator extends StatelessWidget {
  const WaffleCircularIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(
          color: Palette.mimosa,
          backgroundColor: Palette.darkGrey,
        ),
      ),
    );
  }
}
