import 'package:flutter/material.dart';

class OutAbout extends StatefulWidget {
  const OutAbout({super.key});

  @override
  State<OutAbout> createState() => _OutAboutState();
}

class _OutAboutState extends State<OutAbout> {
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
                    'Why do we monitor the Outdoor Temperature and Humidity?',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                    'To always make sure that the atmosphere inside the building is isolated from the atmosphere outside the building.',
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
                    'How do you know that the atmoshpere inside the building is isolated?',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                    'By calculating the differences between the inner temperature and humidity and the outer temperature and humidity. For the temperature, the temperature inside the building must be at least less than the outside temperature by 3 °C. For the Humidity, the humidity inside the building must be more than the outside humidity and be in range between 40 % and 60 %.',
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
