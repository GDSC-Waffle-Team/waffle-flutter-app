import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class WaffleLoginButton extends StatelessWidget {
  WaffleLoginButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.child});

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
            child: child,
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: Palette.darkGrey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Palette.tickGrey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 15,
                      offset: Offset.zero)
                ])));
  }
}
