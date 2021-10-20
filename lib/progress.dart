import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lynn/main.dart';
import 'package:lynn/search.dart';
import 'accesories.dart';
import 'package:numberpicker/numberpicker.dart';
import 'accesories.dart';
import 'dart:math';
import 'package:syncfusion_flutter_sliders/sliders.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

class progress extends StatefulWidget {
  // progress({Key? key}) : super(key: key);

  @override
  _progressState createState() => _progressState();
}

class _progressState extends State<progress> {
  TextEditingController weight_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var list_1 = [3, 7, 4];
    Map<dynamic, dynamic> map1 = {
      'zero': {'num': 34},
      'one': 10,
      'two': 2
    };
    Map<dynamic, dynamic> food = {
      'papaya': {'name': 'papaya', 'calories': 34, 'protein': 90, 'score': 3},
      'egg': {'name': 'egg', 'calories': 44, 'protein': 90, 'score': 3},
      'rice': {'name': 'rice', 'calories': 54, 'protein': 90, 'score': 3},
    };

    var neww_list = [];

    return Scaffold(
      appBar: the_appbar(),
      body: ListView(
        children: [
          Container(
            height: 100,
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("users").snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return !snapshot.hasData
                    ? Text('PLease Wait')
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data.docs[index];
                          return Text(data['map']['haha'].toString());
                        },
                      );
              },
            ),
          ),
          chartbar(),
          Text("hahahha"),
          Center(child: Text(sum(neww_list).toString())),
          //text somehitng and them imma add to data
          TextFormField(
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            controller: weight_ctrl,
          ),

          //botton
          MaterialButton(
              color: Colors.amber,
              onPressed: () {
                addweight(int.parse(weight_ctrl.text));
              }),
          Center(child: Text(list_1.toString())),
          Center(child: Text(sum(list_1))),
          return_button(context),
          // Center(child: Text(food['one'].toString())),
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: food.length,
              itemBuilder: (BuildContext context, int index) {
                var newlist = food.keys.toList();
                var cal = (food[newlist[index]]['calories']).toString();
                var cal_int = (food[newlist[index]]['calories']);
                var name = (food[newlist[index]]['name']).toString();
                return Center(
                    child: GestureDetector(
                  onTap: () {
                    print("$name");
                    setState(() {
                      neww_list.add(list_1);
                      print("$neww_list");
                      print("$sum(neww_list)");
                      // neww_list = [];
                    });
                  },
                  child: Container(
                      height: 20,
                      width: 130,
                      color: Colors.amber,
                      child: Text("$cal $name")),
                ));
              },
            ),
          ),
          Center(child: Text(neww_list.toString())),
        ],
      ),
    );
  }
}

chartbar() {
  return Container(
    height: 100,
    child: StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection("users").doc('op').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final List<num> points = [1, 9, 8, 6, 23, 1, 7, 18, 45];
        final cloud_points = snapshot.data['W'];
        return !snapshot.hasData ? Text('PLease Wait') : Text('op');
        // : SfSparkLineChart(
        //     color: main_color,
        //     trackball: SparkChartTrackball(
        //         activationMode: SparkChartActivationMode.tap),
        //     //Enable marker
        //     marker: SparkChartMarker(
        //         displayMode: SparkChartMarkerDisplayMode.all),
        //     data: cloud_points.cast<int>());
      },
    ),
  );
}

Future<void> addweight(w) {
  return users
      .doc('op')
      .update({
        'full_name': "Mary Jane",
        'W': FieldValue.arrayUnion([w])
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> addweight_map(w) {
  return users
      .doc('op')
      .update({
        'full_name': "Mary Jane",
        'W': FieldValue.arrayUnion([w])
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

sum(list1) {
  var sum = 0;
  var given_list = list1;

  for (var i = 0; i < given_list.length; i++) {
    sum += given_list[i];
  }

  var sumtostring = sum.toString();
  return sumtostring;
  // print("$sum");
}

return_button(context) {
  return MaterialButton(
      color: Colors.amber,
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => search()));
      });
}
