import 'package:flutter/material.dart';
import 'package:google_clone_flutter/widgets/web/search_button.dart';

class SearchButtons extends StatelessWidget {
  const SearchButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchButton(text: 'Google Search'),
            SearchButton(text: 'I am feeling lucky'),
          ],
        ),
      ],
    );
  }
}
