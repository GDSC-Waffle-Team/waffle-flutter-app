import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class WaffleCharacter extends StatelessWidget {
  const WaffleCharacter({Key? key, required this.width});

  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 45.0),
        child: Text(
          "Powered by",
          style: TextStyle(
              color: Palette.tickGrey,
              fontSize: 15,
              fontWeight: FontWeight.w100),
        ),
      ),
      Image(image: AssetImage("assets/images/waffle.png"), width: width)
    ]);
  }
}
