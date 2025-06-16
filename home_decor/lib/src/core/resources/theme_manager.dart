import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_decor/l10n/l10n.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: L10n.currentLocale.languageCode == 'en'
        ? 'Poppins'
        : GoogleFonts.tajawal().fontFamily,
    primaryColor: ColorManager.primaryColor,
    scaffoldBackgroundColor: ColorManager.whiteColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorManager.primaryColor,
      onPrimary: ColorManager.lightPrimaryColor,
      secondary: ColorManager.primaryColor,
      onSecondary: ColorManager.darkIconColor,
      primaryContainer: ColorManager.lightPrimaryColor,
      error: Colors.red,
      onError: Colors.white,
      surface: ColorManager.lightPrimaryColor.withAlpha(40),
      onSurface: ColorManager.blackColor, // color of text
    ),
    useMaterial3: true,
  );



  static final ThemeData dark = ThemeData(
    fontFamily: L10n.currentLocale.languageCode == 'en'
        ? 'Poppins'
        : GoogleFonts.tajawal().fontFamily,
    primaryColor: ColorManager.primaryColor,

    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    ),

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: ColorManager.whiteColor,
      secondary: ColorManager.darkPrimaryColor,
      onSecondary: Colors.white70,
      surface: ColorManager.darkPrimaryColor,
      onSurface: Colors.white,
      onPrimary: ColorManager.whiteColor,

      error: Colors.red,
      onError: Colors.white,
    ),
    useMaterial3: true,
  );
}
