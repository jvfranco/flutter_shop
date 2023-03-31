import 'package:flutter/material.dart';

class Bagde extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;

  const Bagde({required this.child, required this.value, this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
      ],
    );
  }
}
