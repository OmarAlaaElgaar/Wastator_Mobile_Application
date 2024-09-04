import 'package:wastator/screens/CO2/co2about.dart';
import 'package:wastator/screens/CO2/co2graph.dart';
import 'package:flutter/material.dart';
import 'package:wastator/screens/CO2/CO2C.dart';

class CO2Nav extends StatefulWidget {
  const CO2Nav({super.key});

  @override
  State<CO2Nav> createState() => _CO2NavState();
}

class _CO2NavState extends State<CO2Nav> {
  int index = 0;
  final screens = [
    const CO2C(),
    const CO2Graph(),
    const CO2About(),
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
