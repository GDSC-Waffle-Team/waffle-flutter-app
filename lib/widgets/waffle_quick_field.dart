import 'package:flutter/material.dart';
import 'package:waffle/styles/palette.dart';

class WaffleQuickField extends StatelessWidget {
  const WaffleQuickField(
      {Key? key,
      required this.textInputAction,
      required this.controller,
      required this.hintText});

  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextFormField(
            textInputAction: textInputAction,
            controller: controller,
            cursorColor: Palette.tickGrey,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: hintText,
              focusColor: Palette.darkGrey,
              border: InputBorder.none,
            ),
          ),
        ),
        margin: const EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
          color: Palette.lightGrey,
          border: Border.all(color: Palette.tickGrey),
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
