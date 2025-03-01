import 'package:flutter/material.dart';
import 'package:google_clone_flutter/colors.dart';

class SearchButton extends StatelessWidget {
  final String text;
  const SearchButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: MaterialButton(
        elevation: 0,
        padding: const EdgeInsets.all(20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        onPressed: () {},
        color: searchColor,
        child: Text(
          text,
          style: const TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}
