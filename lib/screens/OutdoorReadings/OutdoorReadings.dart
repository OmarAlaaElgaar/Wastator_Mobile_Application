// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class OutdoorReadings extends StatefulWidget {
  const OutdoorReadings({super.key});

  @override
  State<OutdoorReadings> createState() => _OutdoorReadingsState();
}

class _OutdoorReadingsState extends State<OutdoorReadings> {
  late DatabaseReference OTRef;
  late DatabaseReference OHRef;
  double OTreading = 0;
  double OHreading = 0;

  @override
  void initState() {
    super.initState();
    OTRef = FirebaseDatabase.instance.ref("esp32/Outdoor Temperature");
    OTReader();
    print(OTreading);

    super.initState();
    OHRef = FirebaseDatabase.instance.ref("esp32/HumidityOut");
    OHReader();
    print(OHreading);
  }

  void OTReader() {
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
  }

  void OHReader() {
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Outdoor Readings'),
        ),
        body: Column(
          children: [
            Center(
              child: FittedBox(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: SfRadialGauge(
                            title: const GaugeTitle(
                              text: 'Outdoor Temperature',
                              textStyle: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            enableLoadingAnimation: true,
                            animationDuration: 4500,
                            axes: <RadialAxis>[
                              RadialAxis(
                                minimum: 0,
                                maximum: 50,
                                pointers: <GaugePointer>[
                                  RangePointer(
                                      value: OTreading, enableAnimation: true)
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    widget: Text(
                                      '$OTreading °C',
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    positionFactor: 0.5,
                                    angle: 90,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: SfRadialGauge(
                            title: const GaugeTitle(
                              text: 'Outdoor Humidity',
                              textStyle: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            enableLoadingAnimation: true,
                            animationDuration: 4500,
                            axes: <RadialAxis>[
                              RadialAxis(
                                minimum: 0,
                                maximum: 100,
                                pointers: <GaugePointer>[
                                  RangePointer(
                                      value: OHreading, enableAnimation: true)
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    widget: Text(
                                      '$OHreading %',
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    positionFactor: 0.5,
                                    angle: 90,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
