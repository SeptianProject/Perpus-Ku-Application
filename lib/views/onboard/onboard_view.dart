import 'package:flutter/material.dart';
import 'package:perpus_digital/controllers/onboard_controller.dart';
import 'package:perpus_digital/models/onboard_model.dart';
import 'package:perpus_digital/views/auth/login_view.dart';
import 'package:perpus_digital/widgets/onboard/dot_indicator.dart';
import 'package:perpus_digital/widgets/onboard/onboard_content.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => OnboardController();

  Widget build(context, OnboardController controller) {
    controller.view = this;
    return Scaffold(
        backgroundColor: const Color(0xffFEFEFE),
        body: Column(children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    controller.pageIndex == content.length - 1
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()))
                        : null;
                  },
                  style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(0),
                      shadowColor: WidgetStateColor.transparent,
                      splashFactory: controller.pageIndex == content.length - 1
                          ? InkSplash.splashFactory
                          : NoSplash.splashFactory),
                  child: Text(
                      controller.pageIndex == content.length - 1
                          ? "Lewati"
                          : "",
                      style: TextStyle(
                          color: controller.pageIndex == content.length - 1
                              ? const Color(0xff5A7BFA)
                              : Colors.transparent,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6))),
              const SizedBox(width: 20),
            ],
          ),
          Expanded(
              child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: content.length,
                  controller: controller.pageController,
                  onPageChanged: controller.doPageChange,
                  itemBuilder: (context, index) => OnBoardContent(
                      image: content[index].image.toString(),
                      title: content[index].title,
                      description: content[index].description))),
          Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Row(children: [
                const Spacer(),
                ...List.generate(
                    content.length,
                    (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DotIndicator(
                            isActive: index == controller.pageIndex))),
                const Spacer()
              ]))
        ]));
  }
}
