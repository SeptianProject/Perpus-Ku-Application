// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perpus_digital/views/onboard/signin_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // final FirebaseAuthServices _auth = FirebaseAuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final bool _isSignup = false;

  final textFieldFocus = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocus.hasPrimaryFocus) {
        return;
      }
      textFieldFocus.canRequestFocus = false;
    });
  }

  // @override
  // void dispose() {
  //   _usernameController.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFEFE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xff5A7BFA),
            )),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text('Selamat Datang!',
                  style: TextStyle(
                      color: Color(0xff444444),
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center),
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child: Text('Isi formulir pendaftaran untuk membuat akun baru.',
                    style: TextStyle(
                        color: Color(0xff444444),
                        fontSize: 18,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 320,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: const Color(0xff444444),
                        cursorWidth: 1,
                        cursorOpacityAnimates: true,
                        style: const TextStyle(
                            color: Color(0xff444444),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        validator: (valueName) {
                          if (valueName!.isEmpty) {
                            return 'Mohon isi nama anda terlebih dulu';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            isDense: true,
                            filled: true,
                            fillColor: const Color(0xff5A7BFA).withOpacity(0.1),
                            label: const Text(
                              'Nama Anda',
                              style: TextStyle(
                                color: Color(0xff444444),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                            prefixIcon: const Icon(
                              Icons.person_4,
                              color: Color(0xff444444),
                            )),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        cursorColor: const Color(0xff444444),
                        cursorWidth: 1,
                        cursorOpacityAnimates: true,
                        style: const TextStyle(
                            color: Color(0xff444444),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (valueEmail) {
                          if (valueEmail!.isEmpty) {
                            return 'Mohon isi email terlebih dulu';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            isDense: true,
                            filled: true,
                            fillColor: const Color(0xff5A7BFA).withOpacity(0.1),
                            label: const Text(
                              'Masukkan Email',
                              style: TextStyle(
                                color: Color(0xff444444),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                            prefixIcon: const Icon(
                              Icons.alternate_email,
                              color: Color(0xff444444),
                            )),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        cursorColor: const Color(0xff444444),
                        cursorWidth: 1,
                        cursorOpacityAnimates: true,
                        obscureText: _obscured,
                        focusNode: textFieldFocus,
                        style: const TextStyle(
                            color: Color(0xff444444),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        validator: (valuePass) {
                          if (valuePass!.isEmpty) {
                            return 'Mohon isi password terlebih dulu';
                          } else if (valuePass.length <= 6) {
                            return 'Mohon isi lebih dari 6 karakter';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          isDense: true,
                          filled: true,
                          fillColor: const Color(0xff5A7BFA).withOpacity(0.1),
                          label: const Text(
                            'Password',
                            style: TextStyle(
                              color: Color(0xff444444),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xff444444),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: _toggleObscured,
                            child: Icon(
                              _obscured
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0xff444444),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: () {
                            _register();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff5A7BFA),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          child: _isSignup
                              ? const SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.white54,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Daftar',
                                  style: TextStyle(
                                      color: Color(0xfffefefe),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  Container(
                    color: const Color(0xff444444),
                    height: 0.4,
                    width: 100,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Atau lanjutkan dengan',
                      style: TextStyle(
                          color: Color(0xff444444),
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    color: const Color(0xff444444),
                    height: 0.4,
                    width: 100,
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                alignment: Alignment.bottomCenter,
                height: 300,
                decoration: const BoxDecoration(
                    color: Color(0xff5A7BFA),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfffefefe),
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/google.png',
                                width: 18,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Masuk menggunakan Google',
                                style: TextStyle(
                                  color: Color(0xff444444),
                                  fontSize: 13,
                                ),
                              )
                            ],
                          )),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfffefefe),
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/facebook.png',
                                width: 18,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Masuk menggunakan Facebook',
                                style: TextStyle(
                                  color: Color(0xff444444),
                                  fontSize: 13,
                                ),
                              )
                            ],
                          )),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sudah punya akun?',
                          style: TextStyle(
                            color: Color(0xfffefefe),
                            fontSize: 12,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Text(
                            'Login Sekarang',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': _nameController.text,
        'email': _emailController.text,
      });
      showAlertDilaog(context);
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Akun Gagal Didaftarkan'),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Baiklah'))
              ],
            );
          });
    }
  }

  showAlertDilaog(BuildContext context) {
    Widget button = TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
        child: const Text("Baiklah"));

    AlertDialog alert = AlertDialog(
      title: const Text("Kerja Bagus"),
      content: const Text("Akun Berhasil Didaftarkan"),
      actions: [button],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}

// setState(() {
  //   _isSignup = true;
  // });

  // String username = _usernameController.text;
  // String email = _emailController.text;
  // String password = _passwordController.text;

  // User? user = await _auth.signUpWithEmailAndPassword(email, password);

  // setState(() {
  //   _isSignup = false;
  // });

  // if (user != null) {
  //   print("User Successfull");
  //   // ignore: use_build_context_synchronously
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => HomePage()));
  // } else {
  //   print("Error Broh");
  // }
