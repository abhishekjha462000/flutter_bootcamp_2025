import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;
  const HourlyForecastItem(
      {super.key,
      required this.time,
      required this.icon,
      required this.temperature});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(time,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Icon(icon, size: 20),
              const SizedBox(height: 10),
              Text(temperature, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
