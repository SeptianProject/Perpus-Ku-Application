// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:perpus_digital/widgets/button/styleform.dart';

class RButton extends StatefulWidget {
  final void Function() onPressed;
  final ButtonStyle style;
  final Widget child;
  const RButton({
    Key? key,
    required this.child,
    required this.style,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<RButton> createState() => _RButtonState();
}

class _RButtonState extends State<RButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: buttonStyle,
      child: widget.child,
    );
  }
}
