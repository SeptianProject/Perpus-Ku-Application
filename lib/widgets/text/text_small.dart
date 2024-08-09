import 'package:flutter/material.dart';

class TextSmall extends StatelessWidget {
  final String text;
  final Color? color;
  const TextSmall({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
