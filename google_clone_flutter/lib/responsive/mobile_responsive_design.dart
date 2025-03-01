import 'package:flutter/material.dart';
import 'package:google_clone_flutter/colors.dart';

class MobileResponsiveDesign extends StatelessWidget {
  const MobileResponsiveDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hello From Mobile!',
        style: TextStyle(
            fontSize: 50, fontWeight: FontWeight.bold, color: primaryColor),
      ),
    );
  }
}
