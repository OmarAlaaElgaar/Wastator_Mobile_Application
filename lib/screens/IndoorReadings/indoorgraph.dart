// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InGraph extends StatefulWidget {
  const InGraph({super.key});

  @override
  State<InGraph> createState() => _InGraphState();
}

class _InGraphState extends State<InGraph> {
  List<FlSpot> ITDataPoints = [];
  List<FlSpot> IHDataPoints = [];
  int trialCount = 0;
  Timer? timer;

  late DatabaseReference ITRef;
  late DatabaseReference IHRef;
  double ITreading = 0;
  double IHreading = 0;

  @override
  void initState() {
    super.initState(); // Call super.initState() once

    ITRef = FirebaseDatabase.instance.ref("esp32/Indoor Temperature");
    IHRef = FirebaseDatabase.instance.ref("esp32/HumidityIn");

    // Initialize listeners
    ITRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        try {
          final number = double.parse(event.snapshot.value.toString());
          setState(() {
            ITreading = number;
          });
        } catch (e) {
          print(e);
        }
      }
    });

    IHRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        try {
          final number = double.parse(event.snapshot.value.toString());
          setState(() {
            IHreading = number;
          });
        } catch (e) {
          print(e);
        }
      }
    });

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (trialCount < 6) {
          ITDataPoints.add(FlSpot(trialCount.toDouble(), ITreading));
          IHDataPoints.add(FlSpot(trialCount.toDouble(), IHreading));
          trialCount++;
        } else {
          ITDataPoints.clear();
          IHDataPoints.clear();
          trialCount = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Indoor Graphs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Indoor Temperature',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              width: 300,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: ITDataPoints,
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                          radius: 6,
                          color: Colors.blue,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 50,
                  titlesData: const FlTitlesData(
                    show: false,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text('Indoor Humidity',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              width: 300,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: IHDataPoints,
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                          radius: 6,
                          color: Colors.green,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 100,
                  titlesData: const FlTitlesData(
                    show: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
