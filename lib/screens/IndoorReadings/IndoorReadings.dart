// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class IndoorReadings extends StatefulWidget {
  const IndoorReadings({super.key});

  @override
  State<IndoorReadings> createState() => _IndoorReadingsState();
}

class _IndoorReadingsState extends State<IndoorReadings> {
  late DatabaseReference ITRef;
  late DatabaseReference IHRef;
  double ITreading = 0;
  double IHreading = 0;

  @override
  void initState() {
    super.initState();
    ITRef = FirebaseDatabase.instance.ref("esp32/Indoor Temperature");
    ITReader();
    print(ITreading);

    super.initState();
    IHRef = FirebaseDatabase.instance.ref("esp32/HumidityIn");
    IHReader();
    print(IHreading);
  }

  void ITReader() {
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
  }

  void IHReader() {
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Indoor Readings'),
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
                              text: 'Indoor Temperature',
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
                                      value: ITreading, enableAnimation: true)
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    widget: Text(
                                      '$ITreading °C',
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
                              text: 'Indoor Humidity',
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
                                      value: IHreading, enableAnimation: true)
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    widget: Text(
                                      '$IHreading %',
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
