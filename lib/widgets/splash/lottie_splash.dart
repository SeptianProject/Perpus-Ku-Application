import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class LottieSplash extends StatefulWidget {
  const LottieSplash({super.key});

  @override
  State<LottieSplash> createState() => _LottieSplashState();
}

class _LottieSplashState extends State<LottieSplash> {
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(
          duration: Durations.extralong2,
        ),
        MoveEffect(
          begin: Offset(0, -25),
          end: Offset(0, 25),
          duration: Durations.extralong2,
          curve: Curves.easeInOutBack,
        )
      ],
      delay: const Duration(milliseconds: 650),
      child: Lottie.asset(
        'assets/splash_book.json',
        width: 280,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
