import 'package:flutter/material.dart';
import 'package:google_clone_flutter/widgets/web/language_text.dart';

class TranslationButtons extends StatelessWidget {
  const TranslationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text(
          'Google offered in:',
          style: TextStyle(color: Color(0xFFBFBFBF)),
        ),
        SizedBox(width: 8),
        LanguageText(title: 'हिन्दी'),
        SizedBox(width: 8),
        LanguageText(title: 'বাংলা'),
        SizedBox(width: 8),
        LanguageText(title: 'తెలుగు'),
        SizedBox(width: 8),
        LanguageText(title: 'मराठी'),
        SizedBox(width: 8),
        LanguageText(title: 'தமிழ்'),
        SizedBox(width: 8),
        LanguageText(title: 'ગુજરાતી'),
        SizedBox(width: 8),
        LanguageText(title: 'ಕನ್ನಡ'),
        SizedBox(width: 8),
        LanguageText(title: 'മലയാളം'),
        SizedBox(width: 8),
        LanguageText(title: 'ਪੰਜਾਬੀ'),
      ],
    );
  }
}
