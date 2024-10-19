import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whats_app/core/themes/colors.dart';

class AppTheme {
  // Define a function to build ThemeData for the app

  static ThemeData lightTheme(context) {
    return ThemeData(
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      scaffoldBackgroundColor: AppColor.greyColor,
      brightness: Brightness.light,
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 24.0,
      ),
      appBarTheme: AppBarTheme(
        color: AppColor.greyColor,
        elevation: 1.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.secondaryColor,
      ),
    );
  }
}
