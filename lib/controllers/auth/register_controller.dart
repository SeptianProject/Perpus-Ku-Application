import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perpus_digital/views/auth/register_view.dart';
import 'package:perpus_digital/widgets/method/dialog_register.dart';

class RegisterController extends State<RegisterView> {
  static late RegisterController instance;
  late RegisterView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  // final FirebaseAuthServices _auth = FirebaseAuthServices();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();

  final bool isSignup = false;

  final textFieldFocus = FocusNode();
  bool obscured = true;

  void toggleObscured() {
    setState(() {
      obscured = !obscured;
      if (textFieldFocus.hasPrimaryFocus) {
        return;
      }
      textFieldFocus.canRequestFocus = false;
    });
  }

  void register() async {
    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': nameController.text,
        'email': emailController.text,
      });
      showAlertDilaogRegister(context);
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
}
