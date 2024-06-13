import 'package:flutter/material.dart';
import 'package:perpus_digital/controllers/book_controller.dart';

class HistoryPageScreen extends StatefulWidget {
  const HistoryPageScreen({super.key});

  @override
  State<HistoryPageScreen> createState() => _HistoryPageScreenState();
}

class _HistoryPageScreenState extends State<HistoryPageScreen> {
  List<Book> books = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: books.isEmpty
            ? Container(
                child: const Column(
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
            : Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 55, horizontal: 25),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    Book book = books[index];
                    return ListTile(
                      textColor: const Color(0xff444444),
                      leading: const Icon(
                        Icons.bookmark_outline,
                        color: Color(0xff444444),
                        size: 50,
                      ),
                      title: Text(
                        'Nama : ${book.name}',
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            'Tanggal Pinjam : ${book.tglPinjam}',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Tanggal Pengembalian : ${book.tglKembali}',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Color(0xff444444),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: const Color(0xff444444),
                                title: const Text(
                                  'Konfirmasi Hapus',
                                  style: TextStyle(
                                      color: Color(0xfffefefe),
                                      fontFamily: 'Poppins',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                                content: const Text(
                                  'Apakah anda yakin ingin menghapus item ini?',
                                  style: TextStyle(
                                      color: Color(0xfffefefe),
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        child: const Text(
                                          'Batal',
                                          style: TextStyle(
                                              color: Color(0xfffefefe),
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text(
                                          'Hapus',
                                          style: TextStyle(
                                              color: Color(0xfffefefe),
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        onPressed: () {
                                          // Belum terisi
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                  itemCount: books.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1.5,
                      color: Color(0xff444444),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
