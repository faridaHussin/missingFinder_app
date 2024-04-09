import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Application_Theme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFFE8D6D6).withOpacity(0.5),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFFE8D6D6).withOpacity(0.5),
      onSecondaryContainer: Color(0xFFFFFFFF).withOpacity(0.10),
      primary: Color(0xFFD6CACA),
      onSecondary: Color(0xFFFAF5F2).withOpacity(0.80),
      onPrimary: Color(0xFF987B71),
      secondary: Color(0xFF707070).withOpacity(0.80),
      background: Color(0xFFF8F8F8),
      onBackground: Color(0xFFA81A1A),
      onPrimaryContainer: Color(0xFFB7935F).withOpacity(0.9),

    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xFFA81A1A),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),


    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF836548).withOpacity(1.0),
      selectedIconTheme: IconThemeData(
        size: 32,
        color: Colors.black,
      ),
      selectedItemColor: Colors.black,
      unselectedIconTheme: IconThemeData(
        size: 28,
        color: Color(0xB6FFFFFF),
      ),
      unselectedItemColor: Color(0xB6FFFFFF),

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
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
