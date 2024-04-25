import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final primaryColor = Colors.red.shade900;
final baseTheme = ThemeData(brightness: Brightness.dark);

ThemeData appTheme() => ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      textTheme: baseTheme.textTheme.apply(
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryColor,
      ),
    );
