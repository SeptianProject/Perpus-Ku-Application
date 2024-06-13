// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:perpus_digital/models/user_model.dart';

// const String TODO_COLLECTION_REF = "users";

// class FirestoreServices {
//   final _firestore = FirebaseFirestore.instance;

//   late final CollectionReference _usersRef;

//   FirestoreServices() {
//     _usersRef =
//         _firestore.collection(TODO_COLLECTION_REF).withConverter<UserModel>(
//             fromFirestore: (snapshots, _) => UserModel.fromJson(
//                   snapshots.data()!,
//                 ),
//             toFirestore: (user, _) => user.toJson());
//   }

//   Stream<QuerySnapshot> getUser() {
//     return _usersRef.snapshots();
//   }

//   void addUsers(UserModel user) async {
//     _usersRef.add(user);
//   }
// }
