// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perpus_digital/views/auth/signin_page.dart';
import 'package:perpus_digital/widgets/text_field.dart';
import 'package:perpus_digital/widgets/validator.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFEFE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
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
                      RTextField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        validator: Validator.name,
                        label: 'Masukkan nama anda',
                        preffixIcon: Icons.person_4,
                      ),
                      const SizedBox(height: 20),
                      RTextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validator.email,
                        label: 'Masukkan email',
                        preffixIcon: Icons.alternate_email_outlined,
                      ),
                      const SizedBox(height: 20),
                      RTextField(
                        obscureText: _obscured,
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: Validator.password,
                        label: 'Masukkan password',
                        preffixIcon: Icons.lock_outline,
                        suffixIcon: GestureDetector(
                            onTap: _toggleObscured,
                            child: Icon(
                              _obscured
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0xff444444),
                              size: 22,
                            )),
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
              backgroundColor: const Color(0xfffefefe),
              title: const Text(
                'Yahh Gagal',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: Text(
                'Ada inputan yang salah : ${e.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Baiklah',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ))
              ],
            );
          });
    }
  }

  showAlertDilaog(BuildContext context) {
    Widget button = TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
        child: const Text(
          "Baiklah",
          style: TextStyle(fontWeight: FontWeight.w500),
        ));

    AlertDialog alert = AlertDialog(
      backgroundColor: const Color(0xfffefefe),
      title: const Text(
        "Gokil Abis",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      content: const Text(
        "Keren Berhasil",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
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
