import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class WaffleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WaffleAppBar({Key? key, this.color = Palette.lightGrey})
      : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: color, elevation: 0);
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
