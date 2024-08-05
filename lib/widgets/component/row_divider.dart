import 'package:flutter/material.dart';
import 'package:perpus_digital/widgets/text/text_small.dart';

class RowDivider extends StatefulWidget {
  const RowDivider({super.key});

  @override
  State<RowDivider> createState() => _RowDividerState();
}

class _RowDividerState extends State<RowDivider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 20),
        Container(
          color: const Color(0xff444444),
          height: 1,
          width: 100,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextSmall(
            text: 'Atau lanjutkan dengan',
            color: Color(0xff444444),
          ),
        ),
        Container(
          color: const Color(0xff444444),
          height: 1,
          width: 100,
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
