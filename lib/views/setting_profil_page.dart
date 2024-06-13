import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:perpus_digital/controllers/category_controller.dart';
import 'package:perpus_digital/views/home_page.dart';
import 'package:perpus_digital/views/library_page_list.dart';
import 'package:perpus_digital/views/onboarding-screen/signin_page.dart';

class SettingProfilePage extends StatefulWidget {
  const SettingProfilePage({super.key});

  @override
  State<SettingProfilePage> createState() => _SettingProfilePageState();
}

class _SettingProfilePageState extends State<SettingProfilePage> {
  // final FirestoreServices _firestoreServices = FirestoreServices();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffefefe),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: const Column(
                  children: [
                    SizedBox(height: 20),
                    Icon(
                      CupertinoIcons.person_crop_circle_fill,
                      color: Color(0xff444444),
                      size: 120,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Septian Asropik',
                      style: TextStyle(
                          color: Color(0xff444444),
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Mobile Developer',
                      style: TextStyle(
                          color: Color(0xff444444),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Divider(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Akun',
                      style: TextStyle(
                          color: Color(0xff444444),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(CupertinoIcons.person_crop_circle, size: 35),
                        SizedBox(width: 10),
                        Text(
                          'Akun',
                          style: TextStyle(
                              color: Color(0xff444444),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.forward,
                          color: Color(0xff444444),
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aktifitas',
                      style: TextStyle(
                          color: Color(0xff444444),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.bookmark_outline, size: 35),
                        SizedBox(width: 10),
                        Text(
                          'Koleksi',
                          style: TextStyle(
                              color: Color(0xff444444),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.forward,
                          color: Color(0xff444444),
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(
                          color: Color(0xff444444),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 60,
                      child: ListView.builder(
                        itemCount: status.length,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                              width: 110,
                              height: 60,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? const Color(0xff5A7BFA)
                                    : const Color(0xfffefefe),
                                border: current == index
                                    ? Border.all(
                                        color: Colors.transparent, width: 0)
                                    : Border.all(
                                        color: const Color(0xff444444),
                                        width: 0.6),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  status[index],
                                  style: TextStyle(
                                    fontWeight: current == index
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    color: current == index
                                        ? const Color(0xfffefefe)
                                        : const Color(0xff444444),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ingin log out ?',
                    style: TextStyle(
                        color: Color(0xff444444), fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GNav(
          selectedIndex: 2,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            GButton(
              icon: CupertinoIcons.book,
              text: 'Perpus-Ku',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LibraryScreenPage()));
              },
            ),
            GButton(
              icon: CupertinoIcons.person_crop_circle,
              text: 'Profil',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingProfilePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
