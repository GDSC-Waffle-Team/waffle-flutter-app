import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class WaffleEditor extends StatelessWidget {
  const WaffleEditor({Key? key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed(),
        icon: Icon(Icons.edit, color: Palette.tickGrey));
  }
}
