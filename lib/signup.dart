// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lynn/main.dart';
// import 'accesories.dart';
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:lynn/onboarding_quiz.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'bmi.dart';

// class clean_home extends StatefulWidget {
//   // clean_home({Key? key}) : super(key: key);

//   @override
//   _clean_homeState createState() => _clean_homeState();
// }

// class _clean_homeState extends State<clean_home> {
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();
//   var return_pro = return_progress(1, 2, 1200.00, 1100.00);

//   var list1 = ['oi', 'jk,', 'ooo'];
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Future<void> _handleSignIn() async {
//             try {
//               print("io");
//             } catch (error) {
//               print(error);
//             }
//           }
//           // for (var i = 0; i < 10; i++) {
//           //   setState(() {
//           //     return_pro = return_progress(height, width, 120.00, 110.00);
//           //   });
//           //   ;
//           // }
//         },
//       ),
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Container(
//             height: height * 0.05,
//             child: Image(image: AssetImage('assets/logo_2.png'))),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           new Container(
//             height: height * 0.10,
//             width: width,
//             decoration: BoxDecoration(
//               color: Color(0xffffffff),
//               // boxShadow: [
//               //   BoxShadow(
//               //     offset: Offset(0.00, 3.00),
//               //     color: Color(0xff000000).withOpacity(0.16),
//               //     blurRadius: 6,
//               //   ),
//               // ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: emailcontroller,
//               decoration: InputDecoration(

//                   // border: InputBorder.none,
//                   // focusedBorder: InputBorder.none,
//                   // enabledBorder: InputBorder.none,
//                   hintText: "Email"),
//               onChanged: (value) {},
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: passwordcontroller,
//               decoration: InputDecoration(
//                   // border: InputBorder.none,
//                   // focusedBorder: InputBorder.none,
//                   // enabledBorder: InputBorder.none,
//                   hintText: "password"),
//               onChanged: (value) {},
//             ),
//           ),
//           MaterialButton(
//               child: Text(
//                 'sign up',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 20,
//                   color: main_color,
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//               onPressed: () {
//                 signinwithemail(
//                     emailcontroller.text, passwordcontroller.text, context);
//               }),
//           // Container(
//           //     color: main_color,
//           //     height: 200,
//           //     child: Image(image: AssetImage('assets/logo.png')))

//           Text(showcurrentuser())
//         ],
//       ),
//     );
//   }
// }

// return_progress(height, width, maintance, consumed) {
//   var deficit = maintance - consumed;
//   double percentage = consumed / maintance;

//   return new Container(
//     height: 107.00,
//     width: 350.00,
//     child: Stack(
//       children: [
//         Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: height * 0.06,
//               ),
//               Text("$deficit remaining"),
//               Stack(
//                 children: [
//                   Container(
//                     color: Colors.white,
//                     width: width * 0.5,
//                     height: height * 0.04,
//                   ),
//                   Container(
//                     color: Colors.red,
//                     width: width * 0.5 * percentage,
//                     height: height * 0.04,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     decoration: BoxDecoration(
//       color: Colors.amber,
//       boxShadow: [
//         BoxShadow(
//           offset: Offset(0.00, 3.00),
//           color: Color(0xff00b09b).withOpacity(0.35),
//           blurRadius: 6,
//         ),
//       ],
//       borderRadius: BorderRadius.circular(10.00),
//     ),
//   );
// }

// signinwithemail(email, pass, context) {
//   try {
//     FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: email, password: pass);
//   } catch (e) {
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               content: Text(e),
//             ));
//     print("yay");
//   }
// }

// showcurrentuser() {
//   var df = FirebaseAuth.instance.currentUser();
//   if (df = null) {
//     return "null";
//   } else {
//     return df.toString();
//   }
// }
