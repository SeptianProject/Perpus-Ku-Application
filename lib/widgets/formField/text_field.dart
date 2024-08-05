import 'package:flutter/material.dart';

class RTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String label;
  final IconData preffixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  const RTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.validator,
    required this.label,
    required this.preffixIcon,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  State<RTextField> createState() => _RTextFieldState();
}

class _RTextFieldState extends State<RTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      cursorColor: const Color(0xff444444),
      cursorWidth: 1,
      cursorOpacityAnimates: true,
      style: const TextStyle(
          color: Color(0xff444444), fontSize: 14, fontWeight: FontWeight.w500),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: true,
        filled: true,
        fillColor: const Color(0xff5A7BFA).withOpacity(0.1),
        label: Text(
          widget.label,
          style: const TextStyle(
            color: Color(0xff444444),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        prefixIcon: Icon(
          widget.preffixIcon,
          color: const Color(0xff444444),
        ),
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
