import 'package:flutter/material.dart';
import 'package:perpus_digital/controllers/onboarding_controller.dart';
import 'package:perpus_digital/views/auth/login_view.dart';

class OnBoardingPageScreen extends StatefulWidget {
  const OnBoardingPageScreen({super.key});

  @override
  State<OnBoardingPageScreen> createState() => _OnBoardingPageScreenState();
}

class _OnBoardingPageScreenState extends State<OnBoardingPageScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFEFE),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  _pageIndex == content.length - 1
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()))
                      : null;
                },
                style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(0),
                  shadowColor: WidgetStateColor.transparent,
                  splashFactory: _pageIndex == content.length - 1
                      ? InkSplash.splashFactory
                      : NoSplash.splashFactory,
                ),
                child: Text(
                  _pageIndex == content.length - 1 ? "Lewati" : "",
                  style: TextStyle(
                      color: _pageIndex == content.length - 1
                          ? const Color(0xff5A7BFA)
                          : Colors.transparent,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          Expanded(
              child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: content.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardContent(
                        image: content[index].image.toString(),
                        title: content[index].title,
                        description: content[index].description,
                      ))),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Row(
              children: [
                // _pageIndex < content.length - 2
                //     ? const SizedBox()
                //     : const SizedBox(
                //         width: 40,
                //       ),
                // ElevatedButton(
                //     onPressed: () {
                //       _pageIndex < content.length - 2
                //           ? SystemNavigator.pop()
                //           : _pageController.previousPage(
                //               duration: const Duration(milliseconds: 500),
                //               curve: Curves.ease);
                //     },
                //     style: ElevatedButton.styleFrom(
                //         animationDuration: const Duration(milliseconds: 500),
                //         padding: _pageIndex < content.length - 2
                //             ? const EdgeInsets.fromLTRB(15, 12, 12, 12)
                //             : const EdgeInsets.fromLTRB(20, 12, 12, 12),
                //         shape: _pageIndex < content.length - 2
                //             ? const RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.only(
                //                     topRight: Radius.circular(25),
                //                     bottomRight: Radius.circular(25)))
                //             : const CircleBorder(),
                //         backgroundColor: const Color(0xffFEFEFE),
                //         side: const BorderSide(
                //             color: Color(0xff5A7BFA), width: 2),
                //         elevation: 0),
                //     child: _pageIndex < content.length - 2
                //         ? const Row(
                //             children: [
                //               Icon(Icons.arrow_back_ios,
                //                   size: 15, color: Color(0xff5A7BFA)),
                //               SizedBox(width: 8),
                //               Text('Keluar',
                //                   style: TextStyle(
                //                       fontWeight: FontWeight.w600,
                //                       fontSize: 18,
                //                       color: Color(0xff5A7BFA))),
                //             ],
                //           )
                //         : const Icon(
                //             Icons.arrow_back_ios,
                //             size: 20,
                //             weight: 40,
                //             color: Color(0xff5A7BFA),
                //           )),
                const Spacer(),
                ...List.generate(
                    content.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: DotIndicator(
                            isActive: index == _pageIndex,
                          ),
                        )),
                const Spacer(),
                // _pageIndex == content.length - 1
                //     ? ElevatedButton(
                //         onPressed: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => LoginPage()));
                //         },
                //         style: ElevatedButton.styleFrom(
                //           animationDuration: const Duration(milliseconds: 500),
                //           padding: const EdgeInsets.fromLTRB(20, 12, 12, 12),
                //           shape: const RoundedRectangleBorder(
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(25),
                //                 bottomLeft: Radius.circular(25)),
                //           ),
                //           backgroundColor: const Color(0xff5A7BFA),
                //         ),
                //         child: const Text(
                //           "Lanjutkan",
                //           style: TextStyle(
                //             fontWeight: FontWeight.w600,
                //             fontSize: 18,
                //             color: Color(0xfffefefe),
                //           ),
                //         ),
                //       )
                //     : const SizedBox()

                // ElevatedButton(
                //   onPressed: () {
                //     _pageIndex == content.length - 1
                //         ? Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const StartedPage()))
                //         : _pageController.nextPage(
                //             duration: const Duration(milliseconds: 500),
                //             curve: Curves.ease);
                //   },
                // style: ElevatedButton.styleFrom(
                //     animationDuration: const Duration(milliseconds: 500),
                //     padding: _pageIndex == content.length - 1
                //         ? const EdgeInsets.fromLTRB(20, 12, 12, 12)
                //         : const EdgeInsets.fromLTRB(15, 12, 12, 12),
                //     shape: _pageIndex == content.length - 1
                //         ? const RoundedRectangleBorder(
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(25),
                //                 bottomLeft: Radius.circular(25)))
                //         : const CircleBorder(),
                //     backgroundColor: const Color(0xff5A7BFA)),
                // child: _pageIndex == content.length - 1
                //     ? const Row(
                //         children: [
                //           Text('Lanjut',
                //               style: TextStyle(
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 18,
                //                   color: Color(0xfffefefe))),
                //           SizedBox(width: 8),
                //           Icon(
                //             Icons.arrow_forward_ios,
                //             size: 15,
                //             color: Color(0xfffefefe),
                //           )
                //         ],
                //       )
                //       : const Icon(
                //           Icons.arrow_forward_ios,
                //           size: 20,
                //           weight: 100,
                //           color: Color(0xfffefefe),
                //         ),
                // ),
                // _pageIndex == content.length - 1
                //     ? const SizedBox()
                //     : const SizedBox(
                //         width: 40,
                //       )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
        SizedBox(
          width: 300,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(0xff444444)),
            textAlign: TextAlign.center,
          ),
        ),
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
