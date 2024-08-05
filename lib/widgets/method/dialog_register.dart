import 'package:flutter/material.dart';
import 'package:perpus_digital/views/auth/login_view.dart';

showAlertDilaogRegister(BuildContext context) {
  Widget button = TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginView(),
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
