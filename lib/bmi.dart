import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  // bmi({Key? key}) : super(key: key);

  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bmi"),
      ),
    );
  }
}
