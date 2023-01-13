import 'package:flutter/material.dart';

class WaffleNotificator extends StatelessWidget {
  const WaffleNotificator(
      {Key? key,
      required this.text,
      required this.content_text,
      required this.actions});

  final Text text;
  final Text content_text;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: text,
      content: content_text,
      actions: actions,
    );
  }
}
