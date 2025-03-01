import 'package:flutter/material.dart';
import 'package:google_clone_flutter/colors.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Advertising',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w400),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Business',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w400),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'How Search Works',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Privacy',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w400),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Terms',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w400),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Settings',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
