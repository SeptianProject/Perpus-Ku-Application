import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perpus_digital/views/auth/login_view.dart';
import 'package:perpus_digital/widgets/method/dialog_login.dart';
import 'package:perpus_digital/widgets/text/text_sub.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();

  final bool isSignin = false;

  final textFieldFocus = FocusNode();
  bool obscured = true;

  // ignore: unused_element

  void toggleObscured() {
    setState(() {
      obscured = !obscured;
      if (textFieldFocus.hasPrimaryFocus) {
        return;
      }
      textFieldFocus.canRequestFocus = false;
    });
  }

  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      showAlertDilaogLogin(context);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          icon: const Icon(Icons.warning_amber_outlined),
          title: const TextSub(text: 'Login Gagal😭'),
          content: Text(
            e.toString(),
            style: const TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const TextSub(text: 'Baiklah'))
          ],
        ),
      );
    }
  }
}
