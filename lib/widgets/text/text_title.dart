import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  const TextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            color: Color(0xff444444),
            fontSize: 32,
            fontWeight: FontWeight.w700),
        textAlign: TextAlign.center);
  }
}
