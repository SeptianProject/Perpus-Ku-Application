import 'package:flutter/material.dart';
import 'package:perpus_digital/widgets/text/text_title.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 350,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 30),
        SizedBox(width: 300, child: TextTitle(text: title)),
        const SizedBox(height: 30),
        SizedBox(
          width: 360,
          child: Text(
            description,
            style: const TextStyle(fontSize: 16, color: Color(0xff444444)),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
        const Spacer(),
      ],
    );
  }
}
