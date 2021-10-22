// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// import 'package:lynn/signup.dart';
// import 'package:firebase_core/firebase_core.dart';

// class landlandpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<dynamic>(
//       stream:  firebase_auth.FirebaseAuth.instance.currentUser(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           User user = snapshot.data;
//           if (user == null) {
//             return clean_home();
//           }
//           return clean_home();
//         } else {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
