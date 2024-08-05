import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final Color? color;
  final String text;
  const DefaultButton({super.key, required this.text, this.color});

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
