// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OutGraph extends StatefulWidget {
  const OutGraph({super.key});

  @override
  State<OutGraph> createState() => _OutGraphState();
}

class _OutGraphState extends State<OutGraph> {
  List<FlSpot> OTDataPoints = [];
  List<FlSpot> OHDataPoints = [];
  int trialCount = 0;
  Timer? timer;

  late DatabaseReference OTRef;
  late DatabaseReference OHRef;
  double OTreading = 0;
  double OHreading = 0;

  @override
  void initState() {
    super.initState(); // Call super.initState() once

    OTRef = FirebaseDatabase.instance.ref("esp32/Outdoor Temperature");
    OHRef = FirebaseDatabase.instance.ref("esp32/HumidityOut");

    // Initialize listeners
    OTRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        try {
          final number = double.parse(event.snapshot.value.toString());
          setState(() {
            OTreading = number;
          });
        } catch (e) {
          print(e);
        }
      }
    });

    OHRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        try {
          final number = double.parse(event.snapshot.value.toString());
          setState(() {
            OHreading = number;
          });
        } catch (e) {
          print(e);
        }
      }
    });

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (trialCount < 6) {
          OTDataPoints.add(FlSpot(trialCount.toDouble(), OTreading));
          OHDataPoints.add(FlSpot(trialCount.toDouble(), OHreading));
          trialCount++;
        } else {
          OTDataPoints.clear();
          OHDataPoints.clear();
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
        title: const Text('Outdoor Graphs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Outdoor Temperature',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              width: 300,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: OTDataPoints,
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
            const Text('Outdoor Humidity',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              width: 300,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: OHDataPoints,
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
