import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:perpus_digital/views/onboard/onboarding_page.dart';
import 'package:perpus_digital/views/onboard/signin_page.dart';
import 'package:perpus_digital/views/splash/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return MaterialApp(
              theme: ThemeData(fontFamily: "Poppins"),
              debugShowCheckedModeBanner: false,
              home: const LoginPage(),
            );
          }
        });
  }
}
