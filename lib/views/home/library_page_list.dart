import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:perpus_digital/controllers/library_controller.dart';
import 'package:perpus_digital/views/home/peminjaman_buku.dart';
import 'package:perpus_digital/views/home/home_page.dart';
import 'package:perpus_digital/views/home/library_page_pinjam.dart';
import 'package:perpus_digital/views/home/setting_profil_page.dart';

class LibraryScreenPage extends StatefulWidget {
  const LibraryScreenPage({super.key});

  @override
  State<LibraryScreenPage> createState() => _LibraryScreenPageState();
}

class _LibraryScreenPageState extends State<LibraryScreenPage> {
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff5A7BFA),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Daftar Buku',
                        style: TextStyle(
                            color: Color(0xfffefefe),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PageDipinjamScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xff444444).withOpacity(0.2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 55, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Dipinjam',
                        style: TextStyle(
                            color: Color(0xff444444),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Buku Terbaru',
                          style: TextStyle(
                              color: Color(0xff444444),
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Lihat Semua',
                              style: TextStyle(
                                  color: Color(0xff5A7BFA),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600))),
                    ]),
              ),
              Container(
                height: 300,
                margin: const EdgeInsets.only(left: 30, top: 20),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: dataBook.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PagePeminjamanScreen()));
                      },
                      child: Container(
                          width: 180,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xff444444), width: 0.2),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  dataBook[index].image,
                                  fit: BoxFit.cover,
                                ),
                              )),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dataBook[index].title,
                                          style: const TextStyle(
                                              color: Color(0xff444444),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          dataBook[index].subtitle,
                                          style: const TextStyle(
                                              color: Color(0xff444444),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.bookmark,
                                      size: 30,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Popular / Trending',
                          style: TextStyle(
                              color: Color(0xff444444),
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Lihat Semua',
                              style: TextStyle(
                                  color: Color(0xff5A7BFA),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600))),
                    ]),
              ),
              Container(
                height: 300,
                margin: const EdgeInsets.only(left: 30, top: 20),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: dataBook.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PageDipinjamScreen()));
                      },
                      child: Container(
                          width: 180,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xff444444), width: 0.2),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  dataBook[index].image,
                                  fit: BoxFit.cover,
                                ),
                              )),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dataBook[index].title,
                                          style: const TextStyle(
                                              color: Color(0xff444444),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          dataBook[index].subtitle,
                                          style: const TextStyle(
                                              color: Color(0xff444444),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.bookmark,
                                      size: 30,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ),
              const Divider(
                height: 50,
                indent: 35,
                endIndent: 35,
                thickness: 0.7,
              ),
              SizedBox(
                width: 380,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: dataBook.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 170,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xff444444),
                            width: 0.3,
                          )),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 105,
                            child: Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  dataBook[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(dataBook[index].title,
                                  style: const TextStyle(
                                      color: Color(0xff444444),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 220,
                                child: Text(
                                  dataBook[index].desc,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(dataBook[index].subtitle,
                                  style: const TextStyle(
                                      color: Color(0xff444444),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                              Text(dataBook[index].date,
                                  style: const TextStyle(
                                      color: Color(0xff444444),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Expanded(
                            child: Transform.translate(
                                offset: const Offset(-10, -10),
                                child: const Icon(
                                  Icons.bookmark_outline,
                                  size: 25,
                                )),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
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
