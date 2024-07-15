import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:perpus_digital/views/core/home_page.dart';
import 'package:perpus_digital/views/core/library_page_list.dart';
import 'package:perpus_digital/views/core/setting_profil_page.dart';

class PageDipinjamScreen extends StatefulWidget {
  const PageDipinjamScreen({super.key});

  @override
  State<PageDipinjamScreen> createState() => _PageDipinjamScreenState();
}

class _PageDipinjamScreenState extends State<PageDipinjamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffefefe),
      appBar: AppBar(
        backgroundColor: const Color(0xfffefefe),
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Transform.translate(
          offset: const Offset(15, 0),
          child: const Text(
            'Perpus-Ku',
            style: TextStyle(
                color: Color(0xff444444),
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.search,
                color: Color(0xff444444),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: const Color(0xfffefefe),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LibraryScreenPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xff444444).withOpacity(0.2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Daftar Buku',
                        style: TextStyle(
                            color: Color(0xff444444),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff5A7BFA),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 55, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Dipinjam',
                        style: TextStyle(
                            color: Color(0xfffefefe),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning,
                      size: 33,
                    ),
                    Text(
                      "Belum ada buku yang dipinjam",
                      style: TextStyle(
                          color: Color(0xff444444),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GNav(
          selectedIndex: 1,
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            GButton(
              icon: CupertinoIcons.book,
              text: 'Perpus-Ku',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LibraryScreenPage(),
                  ),
                );
              },
            ),
            GButton(
              icon: CupertinoIcons.person_crop_circle,
              text: 'Profil',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
