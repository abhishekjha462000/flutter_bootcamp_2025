import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone_flutter/colors.dart';
import 'package:google_clone_flutter/responsive/responsive_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google App Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Gmail',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w400),
              ),
            ),

            // Text Button for Images
            TextButton(
              onPressed: () {},
              child: const Text(
                'Images',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w400),
              ),
            ),

            // give some spacing using sizedbox
            const SizedBox(
              width: 20,
            ),

            // create the more apps icon using flutter svg

            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/more-apps.svg',
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),

            // Make a Elevated Buttonn
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0)
                  .copyWith(right: 10),
              child: MaterialButton(
                onPressed: () {},
                color: const Color(0xff1A73EB),
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            )
          ],
        ),
        body: const ResponsiveScreen(),
      ),
    );
  }
}
