import 'package:flutter/material.dart';
import 'package:perpus_digital/views/onboarding-screen/signin_page.dart';
import 'package:perpus_digital/views/onboarding-screen/signup_page.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFEFE),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Image.asset('assets/started.png'),
              const SizedBox(
                width: 300,
                child: Text(
                  'Buka Pintu Pengetahuan Digital',
                  style: TextStyle(
                      color: Color(0xff444444),
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 25),
              const SizedBox(
                width: 390,
                child: Text(
                  'Pintu menuju pengetahuan terbuka untuk Anda! Masuk atau daftar sekarang di Perpus-Ku untuk akses buku digital dan wawasan literasi yang lebih luas.',
                  style: TextStyle(color: Color(0xff444444), fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Container(
                    width: 320,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff5A7BFA),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                            color: Color(0xffFEFEFE),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 320,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xff444444).withOpacity(0.2),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                            color: Color(0xff444444),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
