import 'package:flutter/material.dart';
import 'package:google_clone_flutter/widgets/search.dart';
import 'package:google_clone_flutter/widgets/web/search_buttons.dart';
import 'package:google_clone_flutter/widgets/web/translation_buttons.dart';
import 'package:google_clone_flutter/widgets/web/web_footer.dart';

class WebResponsiveDesign extends StatelessWidget {
  const WebResponsiveDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Search(),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const SearchButtons(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const TranslationButtons(),
                  ],
                ),

                // footer
                const WebFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
