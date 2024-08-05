import 'package:flutter/material.dart';

class TextLink extends StatefulWidget {
  final String? text;
  const TextLink({super.key, required this.text});

  @override
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text!,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
