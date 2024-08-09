import 'package:flutter/material.dart';

class TextMedium extends StatelessWidget {
  final String text;
  const TextMedium({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xff444444),
        fontSize: 15,
      ),
      textAlign: TextAlign.center,
    );
  }
}
