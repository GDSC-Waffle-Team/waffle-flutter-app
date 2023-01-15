import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class WaffleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WaffleAppBar({Key? key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.lightGrey,
      foregroundColor: Palette.lightGrey,
      surfaceTintColor: Palette.lightGrey,
      scrolledUnderElevation: 2.0,
      elevation: 0.0,
      primary: false,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
