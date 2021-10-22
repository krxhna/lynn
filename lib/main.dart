import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'firstpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bmi.dart';
import 'accesories.dart';

Future<void> main() async {
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Your title',
    home: MyApp(),
  ));
}

FirebaseFirestore firestore = FirebaseFirestore.instance;

class MyApp extends StatelessWidget {
  return_color(f) {
    return MaterialColor(
      f,
      <int, Color>{
        50: Color(f),
        100: Color(f),
        200: Color(f),
        300: Color(f),
        400: Color(f),
        500: Color(f),
        600: Color(f),
        700: Color(f),
        800: Color(f),
        900: Color(f),
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: return_color(main_color_hex)),
      home: bmi(),
    );
  }
}

class home extends StatefulWidget {
  // home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var login = false;
  ScrollController c;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
    login = true;
    c = new PageController();
  }

  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          children: [
            MaterialButton(
                color: Colors.amber,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => FirstPage()));
                }),
            MaterialButton(
              color: login ? Colors.green : Colors.red,
              child: Text(
                login ? "on" : "off",
              ),
              onPressed: () {
                setState(() {
                  login = login ? false : true;
                });
              },
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: login ? Colors.amber : Colors.black,
        ),
        body: login ? iftrue() : iffalse(context, _pageController));
  }
}

iftrue() {
  return Center(
      child: MaterialButton(
          color: Colors.black,
          onPressed: () {
            addUser('fjdska');
          }));
}

iffalse(context, controller) {
  return Center(
      child: Container(
          height: 500,
          width: 500,
          child: PageView(
            /// [PageView.scrollDirection] defaults to [Axis.horizontal].
            /// Use [Axis.vertical] to scroll vertically.
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: [
              Center(
                child: Text("First Page"),
              ),
              Center(
                child: Text("Second Page"),
              ),
              Center(
                child: Text("Third Page"),
              )
            ],
          )));
}

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUser(nah) {
  return users
      .doc(nah)
      .set({'full_name': "Mary Jane", 'age': 18})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> addUser1(nah) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  return users.add({'name': "jk"});
}
