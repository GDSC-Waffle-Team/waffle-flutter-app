import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class WaffleQuicker extends StatelessWidget {
  const WaffleQuicker({Key? key, required this.onPressed, required this.icon});

  final VoidCallback onPressed;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: Palette.mimosa,
      backgroundColor: Palette.darkGrey,
      elevation: 2.0,
      onPressed: onPressed,
      child: icon,
    );
  }
}
