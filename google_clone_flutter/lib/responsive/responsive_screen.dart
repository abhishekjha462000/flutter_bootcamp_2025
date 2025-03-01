import 'package:flutter/material.dart';
import 'package:google_clone_flutter/responsive/mobile_responsive_design.dart';
import 'package:google_clone_flutter/responsive/web_responsive_design.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return width < 650
            ? const MobileResponsiveDesign()
            : const WebResponsiveDesign();
      },
    );
  }
}
