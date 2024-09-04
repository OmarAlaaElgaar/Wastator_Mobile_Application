import 'package:flutter/material.dart';

class CO2About extends StatefulWidget {
  const CO2About({super.key});

  @override
  State<CO2About> createState() => _CO2AboutState();
}

class _CO2AboutState extends State<CO2About> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('About'),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: const Text(
                    'Why do we monitor the Carbon Dioxide Concentration?',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                    'After insulating the building and making the atmosphere inside the building different from the atmosphere ouside the building, we have to monitor the Carbon Dioxide Concentrations to make sure it does not exceed the limit we put which is 400 PPM.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17)),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: const Text(
                    'What happen when the Carbon Dioxide Concentration exceeds the limit of 400 PPM?',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                    'This mobile application will send a warning notification that the Carbon Dioxide Concentration exceeds the limit. When you see the notification, you have to evacuate the building and call for help as the air in the building will be toxic due to high Carbon Dioxide Concentrations.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
