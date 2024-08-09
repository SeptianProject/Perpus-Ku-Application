import 'package:flutter/material.dart';

class TextSub extends StatelessWidget {
  final String text;
  const TextSub({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            color: Color(0xff444444),
            fontSize: 18,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w300),
        textAlign: TextAlign.center);
  }
}
