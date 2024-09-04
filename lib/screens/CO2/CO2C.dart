// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CO2C extends StatefulWidget {
  const CO2C({super.key});

  @override
  State<CO2C> createState() => _CO2CState();
}

class _CO2CState extends State<CO2C> {
  late DatabaseReference CO2Ref;
  double CO2reading = 0;

  @override
  void initState() {
    super.initState();
    CO2Ref = FirebaseDatabase.instance.ref("esp32/CO2");
    CO2Reader();
    print(CO2reading);
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(child: Text('Carbon Dioxide Concentration')),
        ),
        body: Center(
          child: SfRadialGauge(
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
