import 'package:flutter/material.dart';
import 'package:perpus_digital/views/auth/register_view.dart';
import 'package:perpus_digital/widgets/text/text_link.dart';
import 'package:perpus_digital/widgets/text/text_small.dart';

class RBlueContainer extends StatefulWidget {
  final double height;
  const RBlueContainer({super.key, required this.height});

  @override
  State<RBlueContainer> createState() => _BlueContainerState();
}

class _BlueContainerState extends State<RBlueContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: widget.height,
      decoration: const BoxDecoration(
          color: Color(0xff5A7BFA),
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      child: Column(
        children: [
          const SizedBox(height: 60),
          SizedBox(
            width: 300,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfffefefe),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/google.png',
                      width: 18,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    const TextSmall(
                      text: 'Masuk menggunakan Google',
                      color: Color(0xff444444),
                    ),
                  ],
                )),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: 300,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfffefefe),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/facebook.png',
                      width: 18,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    const TextSmall(
                      text: 'Masuk menggunakan Facebook',
                      color: Color(0xff444444),
                    )
                  ],
                )),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextSmall(text: 'Belum punya akun?', color: Colors.white),
              TextButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterView(),
                        ),
                      ),
                  child: const TextLink(text: 'Daftar Sekarang')),
            ],
          )
        ],
      ),
    );
  }
}
