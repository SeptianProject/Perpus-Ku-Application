import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: CircleAvatar(
        radius: 4.5,
        backgroundColor: isActive
            ? const Color(0xff5A7BFA)
            : const Color(0xff444444).withOpacity(0.3),
      ),
    );
  }
}
