import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'accesories.dart';
import 'package:numberpicker/numberpicker.dart';
import 'accesories.dart';

class bmi extends StatefulWidget {
  // bmi({Key? key}) : super(key: key);

  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  TextEditingController height_controller = TextEditingController();
  TextEditingController weight_controller = TextEditingController();
  int _currentValue_weight = 74;

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
        body: Center(
          child: Column(
            children: <Widget>[
              NumberPicker(
                selectedTextStyle: TextStyle(color: Colors.amber, fontSize: 30),
                value: _currentValue_weight,
                minValue: 0,
                maxValue: 500,
                onChanged: (value) =>
                    setState(() => _currentValue_weight = value),
              ),
              Text('Current value: $_currentValue_weight Kgs'),
            ],
          ),
        ));
  }
}
