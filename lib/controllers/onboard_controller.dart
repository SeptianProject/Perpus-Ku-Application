import 'package:flutter/material.dart';
import 'package:perpus_digital/views/onboard/onboard_view.dart';

class OnboardController extends State<OnboardView> {
  static late OnboardController instance;
  late OnboardView view;

  @override
  void initState() {
    instance = this;
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  late PageController pageController;

  int pageIndex = 0;

  doPageChange(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
