import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class WaffleLogoutButton extends StatelessWidget {
  const WaffleLogoutButton({Key? key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(foregroundColor: Palette.tickGrey),
        child: Text("로그아웃",
            style: TextStyle(
                color: Palette.tickGrey,
                fontSize: 15,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
