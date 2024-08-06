import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbar extends StatefulWidget {
  final Function? onFirst;
  final Function? onSecond;
  final Function? onThird;
  const BottomNavbar({
    super.key,
    this.onFirst,
    this.onSecond,
    this.onThird,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GNav(
        selectedIndex: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: const Color(0xff444444).withOpacity(0.3),
        activeColor: const Color(0xfffefefe),
        tabBackgroundColor: const Color(0xff5A7BFA),
        backgroundColor: const Color(0xfffefefe),
        gap: 10,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 800),
        tabs: [
          GButton(
              icon: CupertinoIcons.house_fill,
              text: 'Beranda',
              onPressed: widget.onFirst),
          GButton(
              icon: CupertinoIcons.book,
              text: 'Perpus-Ku',
              onPressed: widget.onSecond),
          GButton(
            icon: CupertinoIcons.person_crop_circle,
            text: 'Profil',
            onPressed: widget.onThird,
          ),
        ],
      ),
    );
  }
}
