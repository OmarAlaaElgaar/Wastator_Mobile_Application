import 'package:flutter/material.dart';
import 'package:wastator/screens/OutdoorReadings/OutdoorReadings.dart';
import 'package:wastator/screens/OutdoorReadings/outdoorabout.dart';
import 'package:wastator/screens/OutdoorReadings/outdoorgraph.dart';

class OutNav extends StatefulWidget {
  const OutNav({super.key});

  @override
  State<OutNav> createState() => _OutNavState();
}

class _OutNavState extends State<OutNav> {
  int index = 0;
  final screens = [
    const OutdoorReadings(),
    const OutGraph(),
    const OutAbout(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.red.shade100,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            height: 72,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.radar), label: 'Readings'),
              NavigationDestination(
                  icon: Icon(Icons.bar_chart), label: 'Graph'),
              NavigationDestination(icon: Icon(Icons.info), label: 'Info')
            ],
          ),
        ),
      ),
    );
  }
}
