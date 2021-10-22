import 'package:flutter/material.dart';
import 'firstpage.dart';
import 'package:lynn/progress.dart';
import 'bmi.dart';
//firstpage

var main_color = Color(0xff00D68A);
var main_main_color = Color(0xff00D68A);
var main_color_hex = 0xff00D68A;

the_appbar() {
  return AppBar(
    elevation: 0,
    leading: Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.toc_sharp,
            color: Colors.black,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    ),
    backgroundColor: Colors.white,
    title: Center(
      child: Text(
        "💮 lynn         ",
        style: TextStyle(color: Colors.black),
      ),
    ),
  );
}

the_drawer(context) {
  return Drawer(
      // elevation: 0,
      child: ListView(
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "💮 lynn         ",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
      drawer_Cards(context, bmi(), "BMI", Icons.outbond_outlined),
      drawer_Cards(context, progress(), "progess", Icons.change_history)
    ],
  ));
}

drawer_Cards(context, page, title, Icon1) {
  return GestureDetector(
    onTap: () {
      // Navigator.pop(context);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (BuildContext context) => page));
    },
    child: Container(
        height: 60,
        // color: Colors.amber,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [Icon(Icon1), Text("  $title")],
          ),
        ))),
  );
}
