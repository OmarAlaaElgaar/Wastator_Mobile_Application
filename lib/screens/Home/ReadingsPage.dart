// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'package:wastator/screens/CO2/co2navigation.dart';
import 'package:wastator/screens/IndoorReadings/indoornavigation.dart';
import 'package:wastator/screens/OutdoorReadings/outdoornavigation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ReadingsPage extends StatefulWidget {
  const ReadingsPage({super.key});

  @override
  State<ReadingsPage> createState() => _ReadingsPageState();
}

class _ReadingsPageState extends State<ReadingsPage> {
  late DatabaseReference CO2Ref;
  double CO2reading = 0;
  late DatabaseReference ITRef;
  late DatabaseReference IHRef;
  double ITreading = 0;
  double IHreading = 0;
  late DatabaseReference OTRef;
  late DatabaseReference OHRef;
  double OTreading = 0;
  double OHreading = 0;

  @override
  void initState() {
    super.initState();
    CO2Ref = FirebaseDatabase.instance.ref("esp32/CO2");
    CO2Reader();
    print(CO2reading);

    super.initState();
    ITRef = FirebaseDatabase.instance.ref("esp32/Indoor Temperature");
    ITReader();
    print(ITreading);

    super.initState();
    IHRef = FirebaseDatabase.instance.ref("esp32/HumidityIn");
    IHReader();
    print(IHreading);

    super.initState();
    OTRef = FirebaseDatabase.instance.ref("esp32/Outdoor Temperature");
    OTReader();
    print(OTreading);

    super.initState();
    OHRef = FirebaseDatabase.instance.ref("esp32/HumidityOut");
    OHReader();
    print(OHreading);
  }

  void CO2Reader() {
    CO2Ref.onValue.listen((event) {
      if (event.snapshot.value != null) {
        try {
          final number = double.parse(event.snapshot.value.toString());
          setState(
            () {
              CO2reading = number;
              if (CO2reading > 400) {
                NotificationService.showNotification(
                    CO2reading,
                    'Carbon Dioxide Alert',
                    'The system has detected High Carbon Dioxide Concentrations');
              }
            },
          );
        } catch (e) {
          print(e);
        }
      }
    });
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
          title: const Text('Wastator Readings'),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CO2Nav()),
                );
              },
              child: Center(
                child: SfRadialGauge(
                  title: const GaugeTitle(
                    text: 'Carbon Dioxide Concentration',
                    textStyle:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  enableLoadingAnimation: true,
                  animationDuration: 4500,
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 300,
                      maximum: 500,
                      pointers: <GaugePointer>[
                        RangePointer(value: CO2reading, enableAnimation: true)
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text(
                            '$CO2reading PPM',
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          positionFactor: 0.5,
                          angle: 90,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: FittedBox(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InNav()),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: SfRadialGauge(
                              title: const GaugeTitle(
                                text: 'Indoor Temperature',
                                textStyle: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
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
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OutNav()),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: SfRadialGauge(
                              title: const GaugeTitle(
                                text: 'Outdoor Temperature',
                                textStyle: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
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
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
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

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _notificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> showNotification(
      double Value, String xd, String xd1) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      xd,
      'High Temperature',
      channelDescription: 'Notification channel for high temperature alerts',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _notificationsPlugin.show(
      0,
      xd,
      xd1,
      platformChannelSpecifics,
    );
  }
}
