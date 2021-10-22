import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'accesories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class onboarding_quiz extends StatefulWidget {
  // onboarding_quiz({Key? key}) : super(key: key);

  @override
  _onboarding_quizState createState() => _onboarding_quizState();
}

class _onboarding_quizState extends State<onboarding_quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 100,
                width: 200,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: question_container("wahts your biological sex",
              ['male', 'feamle', 'other'], onboarding_quiz(), context)),
    );
  }
}

question_container(question, list1, MyPage, context) {
  return Container(
    height: 300,
    width: 300,
    color: Colors.amber,
    child: Column(
      children: [
        Text("$question"),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: list1.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      addUser('nah=d', question, list1[index]);
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              MyPage,
                          transitionDuration: Duration.zero,
                        ),
                      );
                    },
                    child: Container(
                        color: Colors.white,
                        height: 30,
                        width: 40,
                        child: Text(list1[index].toString())),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

CollectionReference users = FirebaseFirestore.instance.collection('users');
Future<void> addUser(nah, q, a) {
  return users
      .doc(nah)
      .update({q: a})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> addUser_new() {
  return users
      .doc()
      .set({'q': 'a'})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
