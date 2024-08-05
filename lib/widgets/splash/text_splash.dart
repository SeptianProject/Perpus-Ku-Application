import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class TextSplash extends StatelessWidget {
  const TextSplash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextAnimator(
      'Perpus-Ku',
      style: const TextStyle(
        color: Color(0xff5A7BFA),
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      characterDelay: const Duration(milliseconds: 150),
      incomingEffect: WidgetTransitionEffects.incomingScaleUp(
          curve: Curves.easeInOutBack, duration: const Duration(seconds: 1)),
      atRestEffect: WidgetRestingEffects.pulse(
          numberOfPlays: 2,
          effectStrength: 0.7,
          delay: const Duration(seconds: 5),
          duration: const Duration(milliseconds: 1600)),
      outgoingEffect: WidgetTransitionEffects.outgoingSlideOutToBottom(),
    );
  }
}
