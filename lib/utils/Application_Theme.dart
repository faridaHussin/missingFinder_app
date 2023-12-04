import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Application_Theme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFFE8D6D6).withOpacity(0.5),
    colorScheme: ColorScheme.fromSeed(
        primary: Color(0xFFD6CACA),
        seedColor: Color(0xFFE8D6D6).withOpacity(0.5),
        onSecondary: Color(0xFFFAF5F2).withOpacity(0.80),
        onPrimary: Color(0xFF987B71).withOpacity(0.5),
        onBackground: Color(0xFFF8F8F8),
        onPrimaryContainer: Color(0xFFB7935F).withOpacity(0.9)),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 40,
        color: Color(0xFFE8D6D6).withOpacity(0.80),
      ),
      bodyLarge: TextStyle(
        fontSize: 28,
        color: Color(0xFFFAF5F2),
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
    ),
  );
}
