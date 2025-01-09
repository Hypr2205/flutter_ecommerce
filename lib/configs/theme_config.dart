import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/configs/app_configs.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static final appTheme = ThemeData(
    primaryColor: ColorConfig.primary,
    scaffoldBackgroundColor: ColorConfig.background,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.robotoMonoTextTheme.toString(),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: ColorConfig.background,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorConfig.secondBackground,
      hintStyle: const TextStyle(
        color: Color(0xffA7A7A7),
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConfig.primary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
  );
}
