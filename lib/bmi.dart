import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'accesories.dart';

class bmi extends StatefulWidget {
  // bmi({Key? key}) : super(key: key);

  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "💮 lynn  ",
            style: TextStyle(color: Colors.black),
          ),

        ),

      ),
      
    );
  }
}
