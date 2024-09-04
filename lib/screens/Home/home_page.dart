// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:wastator/screens/Home/about.dart';
import 'package:wastator/screens/Home/wastator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wastator/screens/CO2/co2navigation.dart';
import 'package:wastator/screens/IndoorReadings/indoornavigation.dart';
import 'package:wastator/screens/OutdoorReadings/outdoornavigation.dart';
import 'package:wastator/screens/Home/ReadingsPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        body: Center(
          child: FittedBox(
              child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WastatorAbout()),
                  );
                },
                child: SizedBox(
                  width: 400,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 0, 0)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const ReadingsPage();
                          },
                        ),
                      );
                    },
                    child: const Text('      All \n Readings'),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 0, 0)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const CO2Nav();
                          },
                        ),
                      );
                    },
                    child: const Text('Carbon Dioxide \n Concentration'),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 0, 0)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const InNav();
                          },
                        ),
                      );
                    },
                    child: const Text('   Indoor \n Readings'),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 0, 0)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const OutNav();
                          },
                        ),
                      );
                    },
                    child: const Text('  Outdoor \n Readings'),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const About()),
                  );
                },
                child: const Text(
                  'Team 10211: \n Mazen Abdelsttar \n Mazen Hisham \n Omar Ahmed \n Omar Alaa',
                  style: TextStyle(
                    fontFamily: 'Bebas Kai',
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
