import 'package:flutter/material.dart';
import 'package:perpus_digital/widgets/splash/lottie_splash.dart';
import 'package:perpus_digital/widgets/splash/text_splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        backgroundColor: Color(0xffFEFEFE),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextSplash(),
              LottieSplash(),
            ],
          ),
        ),
      ),
    );
  }
}
