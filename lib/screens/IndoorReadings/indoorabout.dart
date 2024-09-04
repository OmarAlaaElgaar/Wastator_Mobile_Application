import 'package:flutter/material.dart';

class InAbout extends StatefulWidget {
  const InAbout({super.key});

  @override
  State<InAbout> createState() => _InAboutState();
}

class _InAboutState extends State<InAbout> {
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
                    'Why do we monitor the Indoor Temperature and Humidity?',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                    'To always make sure that the atmosphere in the building is the best for the wastes in it. In addition, they are monitored to maintain the perfect atmosphere for the workers who will monitor the feedback system from inside the buidling.',
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
