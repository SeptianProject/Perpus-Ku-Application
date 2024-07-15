import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:perpus_digital/controllers/category_controller.dart';
import 'package:perpus_digital/controllers/library_controller.dart';
import 'package:perpus_digital/views/core/history_page.dart';
import 'package:perpus_digital/views/core/library_page_list.dart';
import 'package:perpus_digital/views/core/setting_profil_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffefefe),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: const Color(0xff5A7BFA),
      ),
      body: ListView(
        children: [
          Container(
            color: const Color(0xff5A7BFA),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(CupertinoIcons.person_crop_circle_fill,
                            color: Colors.white, size: 50),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Septian Asropik',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Siswa',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HistoryPageScreen()));
                            },
                            icon: const Icon(Icons.history,
                                size: 30, color: Colors.white))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  child: Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xfffefefe),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, -35),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: Material(
                                borderRadius: BorderRadius.circular(12),
                                elevation: 5,
                                child: TextFormField(
                                  cursorColor: const Color(0xff444444),
                                  cursorWidth: 1,
                                  cursorOpacityAnimates: true,
                                  style: const TextStyle(
                                      color: Color(0xff444444),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    isDense: true,
                                    filled: true,
                                    fillColor: const Color(0xfffefefe),
                                    label: const Text(
                                      'Telusuri buku',
                                      style: TextStyle(
                                        color: Color(0xff444444),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      size: 24,
                                      color: Color(0xff444444),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Kategori / Genre',
                                    style: TextStyle(
                                        color: Color(0xff444444),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Lihat Semua',
                                    style: TextStyle(
                                        color: Color(0xff5A7BFA),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            height: 60,
                            child: ListView.builder(
                              itemCount: categories.length,
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
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 12, 12, 12),
                                    width: 110,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: current == index
                                          ? const Color(0xff5A7BFA)
                                          : const Color(0xfffefefe),
                                      border: current == index
                                          ? Border.all(
                                              color: Colors.transparent,
                                              width: 0)
                                          : Border.all(
                                              color: const Color(0xff444444),
                                              width: 0.6),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Text(
                                        categories[index],
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
                          Container(
                            height: 150,
                            margin: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: dataBook.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: Image.asset(
                                      dataBook[index].image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Pilihan Editor',
                                    style: TextStyle(
                                        color: Color(0xff444444),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Lihat Semua',
                                    style: TextStyle(
                                        color: Color(0xff5A7BFA),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 280,
                            margin: const EdgeInsets.only(left: 30),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: dataBook.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          child: Image.asset(
                                              dataBook[index].image,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          width: 140,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                dataBook[index].title,
                                                style: const TextStyle(
                                                    color: Color(0xff444444),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                dataBook[index].subtitle,
                                                style: const TextStyle(
                                                    color: Color(0xff444444),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                dataBook[index].date,
                                                style: const TextStyle(
                                                    color: Color(0xff444444),
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Buku Baru Bulan ini',
                                    style: TextStyle(
                                        color: Color(0xff444444),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Lihat Semua',
                                    style: TextStyle(
                                        color: Color(0xff5A7BFA),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 350,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: dataBook.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 150,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
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
                                        width: 90,
                                        child: Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.asset(
                                              dataBook[index].image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10),
                                          Text(dataBook[index].title,
                                              style: const TextStyle(
                                                  color: Color(0xff444444),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                          SizedBox(
                                            width: 200,
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
                                          const Text('Diperbarui pada tanggal',
                                              style: TextStyle(
                                                  color: Color(0xff444444),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600)),
                                          Text(dataBook[index].date,
                                              style: const TextStyle(
                                                  color: Color(0xff444444),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
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
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
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
