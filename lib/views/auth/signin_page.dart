// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perpus_digital/views/home/home_page.dart';
import 'package:perpus_digital/views/auth/signup_page.dart';
import 'package:perpus_digital/widgets/button/elevated_button.dart';
import 'package:perpus_digital/widgets/button/styleform.dart';
import 'package:perpus_digital/widgets/button/text_button.dart';
import 'package:perpus_digital/widgets/text_field.dart';
import 'package:perpus_digital/widgets/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final bool _isSignin = false;

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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
                const Text('Silakan masuk untuk akses penuh.',
                    style: TextStyle(
                        color: Color(0xff444444),
                        fontSize: 18,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center),
                const SizedBox(height: 60),
                SizedBox(
                  width: 320,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        RTextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.email,
                          label: 'Masukkan email',
                          preffixIcon: Icons.alternate_email_outlined,
                          // suffixIcon: null,
                        ),
                        const SizedBox(height: 25),
                        RTextField(
                          obscureText: _obscured,
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: Validator.password,
                          label: 'Masukkan password',
                          preffixIcon: Icons.lock_outline,
                          // suffixIcon: GestureDetector(
                          //     onTap: _toggleObscured,
                          //     child: Icon(
                          //       _obscured
                          //           ? Icons.visibility
                          //           : Icons.visibility_off,
                          //       color: const Color(0xff444444),
                          //       size: 22,
                          //     )),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                RButton(
                    onPressed: () {
                      _login();
                    },
                    style: _isSignin ? buttonStyle : buttonStyle,
                    child: _isSignin
                        ? const CircularProgressIndicator()
                        : textLogin),
                const SizedBox(height: 60),
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
                const SizedBox(height: 60),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 340,
                  decoration: const BoxDecoration(
                      color: Color(0xff5A7BFA),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40))),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
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
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Belum punya akun?',
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
                                      builder: (context) =>
                                          const RegisterPage()));
                            },
                            child: const Text(
                              'Daftar Sekarang',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
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
        ));
  }

  void _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      showAlertDilaog(context);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          icon: const Icon(Icons.warning_amber_outlined),
          title: const Text('Login Gagal😭',
              style: TextStyle(
                color: Color(0xff444444),
                fontWeight: FontWeight.w600,
              )),
          content: Text(
            e.toString(),
            style: const TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Baiklah'))
          ],
        ),
      );
    }
  }

  showAlertDilaog(BuildContext context) {
    Widget button = TextButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      },
      child: const Text(
        "Baiklah",
        style: TextStyle(
          color: Color(0xff5A7BFA),
          fontWeight: FontWeight.w500,
        ),
      ),
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: const Color(0xfffefefe),
      title: const Text(
        "Gokil Abiss",
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      content: const Text(
        "Akun Anda Berhasil Login",
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
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
    //   _isSignin = true;
    // });

    // String email = _emailController.text;
    // String password = _passwordController.text;

    // User? user = await _auth.signInWithEmailAndPassword(email, password);

    // setState(() {
    //   _isSignin = false;
    // });

    // if (user != null) {
    //   print("User Successfull signIn");
    //   // ignore: use_build_context_synchronously
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => const HomePage()));
    // } else {
    //   print("Error Broh");
    // }