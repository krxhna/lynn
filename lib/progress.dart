import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lynn/main.dart';
import 'accesories.dart';
import 'package:numberpicker/numberpicker.dart';
import 'accesories.dart';
import 'dart:math';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class progress extends StatefulWidget {
  // progress({Key? key}) : super(key: key);

  @override
  _progressState createState() => _progressState();
}

class _progressState extends State<progress> {
  @override
  Widget build(BuildContext context) {
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
                          return Text(data['full_name']);
                        },
                      );
              },
            ),
          ),
          Container(
            height: 100,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc('op')
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                final List<num> points = [1, 9, 8, 6, 23, 1, 7, 18, 45];
                final cloud_points = snapshot.data['w'];
                return !snapshot.hasData
                    ? Text('PLease Wait')
                    : SfSparkLineChart(
                        color: Colors.amber,
                        trackball: SparkChartTrackball(
                            activationMode: SparkChartActivationMode.tap),
                        //Enable marker
                        marker: SparkChartMarker(
                            displayMode: SparkChartMarkerDisplayMode.all),
                        data: cloud_points);
              },
            ),
          ),
        ],
      ),
    );
  }
}
