import 'package:flutter/material.dart';

class TextSmall extends StatefulWidget {
  final String text;
  final Color? color;
  const TextSmall({super.key, required this.text, this.color});

  @override
  State<TextSmall> createState() => _TextSmallState();
}

class _TextSmallState extends State<TextSmall> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.color,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
