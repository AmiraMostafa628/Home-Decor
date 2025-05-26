import 'package:flutter/material.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';

ThemeData getAppLightTheme(){
  return ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        color: ColorManager.primaryColor,
      )

    )
  );
}