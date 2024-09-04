// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CO2Graph extends StatefulWidget {
  const CO2Graph({super.key});

  @override
  State<CO2Graph> createState() => _CO2GraphState();
}

class _CO2GraphState extends State<CO2Graph> {
  List<FlSpot> CO2DataPoints = [];
  int trialCount = 0;
  Timer? timer;

  late DatabaseReference CO2Ref;
  double CO2reading = 0;

  @override
  void initState() {
    super.initState(); // Call super.initState() once

    CO2Ref = FirebaseDatabase.instance.ref("esp32/CO2");

    // Initialize listeners
    CO2Ref.onValue.listen((event) {
      if (event.snapshot.value != null) {
        try {
          final number = double.parse(event.snapshot.value.toString());
          setState(() {
            CO2reading = number;
          });
        } catch (e) {
          print(e);
        }
      }
    });

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) {
        setState(() {
          if (trialCount < 6) {
            CO2DataPoints.add(FlSpot(trialCount.toDouble(), CO2reading));
            trialCount++;
          } else {
            CO2DataPoints.clear();
            trialCount = 0;
          }
        });
      },
    );
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
        title: const Text('CO2 Graph'),
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 300,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: CO2DataPoints,
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
              minY: 300,
              maxY: 500,
              titlesData: const FlTitlesData(
                show: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
