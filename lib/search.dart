import 'package:flutter/material.dart';
import 'package:lynn/accesories.dart';
import 'package:flutter/cupertino.dart';
import 'package:lynn/main.dart';
import 'accesories.dart';
import 'package:numberpicker/numberpicker.dart';
import 'accesories.dart';
import 'dart:math';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
// import 'package:bezier_chart/bezier_chart.dart';

class search extends StatefulWidget {
  // search({Key? key}) : super(key: key);

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var selectedDate = return_date();
    TextEditingController weight_input = TextEditingController();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: main_color,
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("My title"),
                  content: Container(
                    child: Column(
                      children: [
                        TextField(
                          controller: weight_input,
                          decoration: new InputDecoration(
                              labelText: "Enter your weight"),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                        ),
                        RaisedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Select date'),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    MaterialButton(
                        child: Text('Close'),
                        // color: Colors.amber,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    MaterialButton(
                        child: Icon(Icons.done),
                        color: main_color,
                        onPressed: () {
                          addweight('lynn', selectedDate,
                              int.parse(weight_input.text));
                          Navigator.pop(context);
                        })
                  ],
                );
              },
            );
            print("op");
          }),
      appBar: the_appbar(),
      body: Column(
        children: [
          progress_chart('lynn', height),
        ],
      ),
    );
  }
}

class Datapoint {
  num value;
  num xAxis;

  Datapoint(num value, num xAxis) {
    this.value = value;
    this.xAxis = xAxis;
  }
}

SPIT_OUTLIST(keys, weigh) {
  var list1 = [];
  for (var i = 0; i < keys.length; i++) {
    list1.add(weigh[keys[i]]);
  }
  return list1;
}

createlist(keys, weigh) {
  var list1 = [];
  for (var i = 0; i < keys.length; i++) {
    list1.add(weigh[keys[i]]);
  }
  return list1;
}

progress_chart(username, height) {
  return Container(
    height: height * 0.4,
    child: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(username)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final List<num> points = [1, 9, 8, 6, 23, 1, 7, 18, 45];
        final cloud_points_list = (snapshot.data['progress'].keys).toList();
        final cloud_points =
            createlist(cloud_points_list, snapshot.data['progress']);

        return !snapshot.hasData
            ? Text('PLease Wait')
            : SfSparkLineChart(
                color: main_color,
                trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                //Enable marker
                marker: SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                data: cloud_points.cast<int>());
      },
    ),
  );
}

return_date() {
  DateTime now = new DateTime.now();
  DateTime date = new DateTime(now.year, now.month, now.day);
  return date;
}

showAlertDialog(context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<void> addweight(username, date, weight) {
  return users
      .doc(username)
      .set(
        {
          'full_name': "Mary Jane",
          'age': 18,
          'progress': {date.toString(): weight}
        },
        SetOptions(merge: true),
      )
      .then((value) => print("User Added"))
      .catchError(
        (error) => print("Failed to add user: $error"),
      );
}





// Future<void> addweight(nah) {
//   return users
//       .doc(nah)
//       .set({'full_name': "Mary Jane", 'age': 18})
//       .then((value) => print("User Added"))
//       .catchError((error) => print("Failed to add user: $error"));
// }

//           Text(weigh.keys.toList().toString()),
//           Text(([weigh[4]]).toString()),
//           MaterialButton(
//               color: Colors.teal,
//               onPressed: () {
//                 createlist(weigh.keys.toList(), weigh);
//
//
//          })
