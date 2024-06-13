import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:perpus_digital/controllers/book_controller.dart';

class PagePeminjamanScreen extends StatefulWidget {
  final Book? book;
  const PagePeminjamanScreen({super.key, this.book});

  @override
  State<PagePeminjamanScreen> createState() => _PagePeminjamanScreenState();
}

class _PagePeminjamanScreenState extends State<PagePeminjamanScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController tglPinjamController = TextEditingController();
  TextEditingController tglKembaliController = TextEditingController();
  DateTime tglPinjam = DateTime.now();
  DateTime tglKembali = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5A7BFA),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
          height: 600,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: const Color(0xfffefefe),
            shadowColor: Colors.black,
            elevation: 10,
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Peminjaman Buku',
                      style: TextStyle(
                          color: Color(0xff444444),
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    TextFormField(
                      controller: nameController,
                      cursorColor: Color(0xff444444),
                      style: const TextStyle(
                        color: Color(0xff444444),
                        fontFamily: 'Poppins',
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Nama Peminjam',
                        labelStyle: TextStyle(
                            color: Color(0xff444444),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff444444))),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff444444)),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: tglPinjamController,
                      style: const TextStyle(
                        color: Color(0xff444444),
                        fontFamily: 'Poppins',
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Tanggal Pinjam',
                        labelStyle: TextStyle(
                            color: Color(0xff444444),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff444444))),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff444444)),
                        ),
                      ),
                      onTap: () async {
                        final pickDate = await showDatePicker(
                          context: context,
                          initialDate: tglPinjam,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (pickDate != null && pickDate != tglPinjam) {
                          setState(() {
                            tglPinjam = pickDate;
                            tglPinjamController.text =
                                DateFormat('dd-MM-yyyy').format(pickDate);
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      readOnly: true,
                      controller: tglKembaliController,
                      style: const TextStyle(
                        color: Color(0xff444444),
                        fontFamily: 'Poppins',
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Tanggal Pengembalian',
                        labelStyle: TextStyle(
                            color: Color(0xff444444),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff444444))),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff444444)),
                        ),
                      ),
                      onTap: () async {
                        final pickDate = await showDatePicker(
                          context: context,
                          initialDate: tglKembali,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (pickDate != null && pickDate != tglKembali) {
                          setState(() {
                            tglKembali = pickDate;
                            tglKembaliController.text =
                                DateFormat('dd-MM-yyyy').format(pickDate);
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff5A7BFA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.fromLTRB(30, 7, 30, 7),
                          elevation: 6,
                          shadowColor: Colors.black,
                        ),
                        onPressed: () {
                          // Belum terisi
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              color: Color(0xfffefefe),
                              fontFamily: 'Poppins',
                              fontSize: 21,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
