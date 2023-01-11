import 'package:flutter/material.dart';

class WafflePopLocker extends StatelessWidget {
  const WafflePopLocker({Key? key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: child, onWillPop: () async => false);
  }
}
