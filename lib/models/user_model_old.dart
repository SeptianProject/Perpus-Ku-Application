// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   final String? id;
//   final String name;
//   final String email;

//   UserModel({
//     this.id,
//     required this.name,
//     required this.email,
//   });

//   toJson() {
//     return {
//       "name": name,
//       "email": email,
//     };
//   }

//   factory UserModel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;
//     return UserModel(
//       id: document.id,
//       name: data["name"],
//       email: data["email"],
//     );
//   }

  // UserModel.fromJson(Map<String, Object?> json)
  //     : this(
  //         name: json['name'] as String,
  //         email: json['email'] as String,
  //       );

  // UserModel copyWith({
  //   String? name,
  //   String? email,
  // }) {
  //   return UserModel(
  //     name: name ?? this.name,
  //     email: email ?? this.email,
  //   );
  // }

  // Map<String, Object?> toJson() {
  //   return {
  //     'name': name,
  //     'email': email,
  //   };
  // }
// }
