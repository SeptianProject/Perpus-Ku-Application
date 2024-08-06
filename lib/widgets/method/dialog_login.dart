import 'package:flutter/material.dart';
import 'package:perpus_digital/views/home/home_view.dart';

showAlertDilaogLogin(BuildContext context) {
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
