import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone_flutter/colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/google-logo.png',
            height: size.height * 0.15,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: size.width * 0.4,
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: searchBorder),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0).copyWith(left: 16),
                child: SvgPicture.asset(
                  'assets/images/search-icon.svg',
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0).copyWith(right: 16),
                child: SvgPicture.asset(
                  'assets/images/mic-icon.svg',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
