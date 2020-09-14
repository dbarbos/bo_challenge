import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemes {
  static ThemeData mainTheme() {
    return ThemeData(
      primaryColor: const Color(0xff70977E),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        headline6: GoogleFonts.marcellusSc(color: Colors.white, fontSize: 26),
      ),
    );
  }
}
