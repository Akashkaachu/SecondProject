import 'package:adamsdoc/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeClass {
  final lightPrimaryColor = kPrimaryColor;
  final darkPrimaryColor = HexColor('#480032');
  static ThemeData lightTheme = ThemeData(
      primaryColor: ThemeData.light().scaffoldBackgroundColor,
      colorScheme: const ColorScheme.light().copyWith(
          primary: _themeClass.lightPrimaryColor,
          secondary: _themeClass.darkPrimaryColor));
  static ThemeData darkTheme = ThemeData(
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      colorScheme: const ColorScheme.dark()
          .copyWith(primary: _themeClass.darkPrimaryColor));
}

ThemeClass _themeClass = ThemeClass();
