// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:perpus_digital/models/user_model.dart';

// class UserRepo extends GetxController {
//   static UserRepo get instance => Get.find();

//   final _db = FirebaseFirestore.instance;

//   createUser(UserModel user) async {
//     await _db.collection("users").add(user.toJson()).whenComplete(() {
//       Get.snackbar(
//         "Mie Sukses",
//         "Akun Kamu Berhasil Dibuat",
//         snackPosition: SnackPosition.TOP,
//         backgroundColor: Colors.green.withOpacity(0.1),
//         colorText: const Color(0xff444444),
//       );
//       // ignore: body_might_complete_normally_catch_error
//     }).catchError((error, stackTrace) {
//       Get.snackbar(
//         "Error",
//         "Error Bro ada masalah",
//         snackPosition: SnackPosition.TOP,
//         backgroundColor: Colors.red.withOpacity(0.1),
//         colorText: Colors.white,
//       );
//       // ignore: avoid_print
//       print("ERROR - $error");
//     });
//   }

//   Future<UserModel> getUserDetails(String email) async {
//     final snapshot =
//         await _db.collection("users").where("email", isEqualTo: email).get();
//     final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
//     return userData;
//   }

//   Future<List<UserModel>> allUser() async {
//     final snapshot = await _db.collection("users").get();
//     final userData =
//         snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
//     return userData;
//   }
// }
