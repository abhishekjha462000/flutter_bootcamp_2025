import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  final Icon icon;
  final String text;
  final double value;
  const AdditionalInfoItem(
      {super.key, required this.icon, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        icon,
        const SizedBox(height: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 6),
        Text('$value', style: const TextStyle(fontSize: 15)),
      ],
    );
  }
}
