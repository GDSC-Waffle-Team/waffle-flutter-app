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
        child: const Text(
          "Powered by",
          style: const TextStyle(
              color: Palette.tickGrey,
              fontSize: 17,
              fontWeight: FontWeight.w300),
        ),
      ),
      Image(image: AssetImage("assets/images/waffle.png"), width: width),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: const Text(
          "GDSC SKHU",
          style: const TextStyle(
              color: Palette.tickGrey,
              fontSize: 15,
              fontWeight: FontWeight.w300),
        ),
      ),
    ]);
  }
}
