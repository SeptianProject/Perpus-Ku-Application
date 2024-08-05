import 'package:flutter/material.dart';

class TextTitle extends StatefulWidget {
  final String text;
  const TextTitle({super.key, required this.text});

  @override
  State<TextTitle> createState() => _TextTitleState();
}

class _TextTitleState extends State<TextTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: const TextStyle(
            color: Color(0xff444444),
            fontSize: 32,
            fontWeight: FontWeight.w700),
        textAlign: TextAlign.center);
  }
}
