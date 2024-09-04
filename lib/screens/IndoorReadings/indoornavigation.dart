import 'package:wastator/screens/IndoorReadings/indoorabout.dart';
import 'package:wastator/screens/IndoorReadings/indoorgraph.dart';
import 'package:flutter/material.dart';
import 'package:wastator/screens/IndoorReadings/IndoorReadings.dart';

class InNav extends StatefulWidget {
  const InNav({super.key});

  @override
  State<InNav> createState() => _InNavState();
}

class _InNavState extends State<InNav> {
  int index = 0;
  final screens = [
    const IndoorReadings(),
    const InGraph(),
    const InAbout(),
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
