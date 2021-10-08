import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'accesories.dart';
import 'package:numberpicker/numberpicker.dart';
import 'accesories.dart';
import 'dart:math';

class bmi extends StatefulWidget {
  // bmi({Key? key}) : super(key: key);

  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  TextEditingController height_controller = TextEditingController();
  TextEditingController weight_controller = TextEditingController();
  int _currentValue_weight = 74;
  int _currentValue_height = 174;
  int bmi = 0;

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
              Text(
                "Your height in centimeters",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              NumberPicker(
                selectedTextStyle: TextStyle(color: main_color, fontSize: 30),
                value: _currentValue_weight,
                minValue: 0,
                maxValue: 500,
                onChanged: (value) =>
                    setState(() => _currentValue_weight = value),
              ),
              // Text('$_currentValue_weight Kgs'),
              //height
              SizedBox(
                height: 20,
              ),
              Text(
                "Your height in centimeters",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              NumberPicker(
                axis: Axis.horizontal,
                selectedTextStyle: TextStyle(color: main_color, fontSize: 30),
                value: _currentValue_height,
                minValue: 100,
                maxValue: 300,
                onChanged: (value) =>
                    setState(() => _currentValue_height = value),
              ),

              // Text('$_currentValue_height cms'),

              ElevatedButton(
                  child: Text("calcuate my bmi"),
                  style: ElevatedButton.styleFrom(
                    primary: main_color,
                    // onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      bmi = (_currentValue_height / 100).toInt() +
                          _currentValue_weight;
                    });
                  }),

              Text("$bmi")
            ],
          ),
        ));
  }
}
