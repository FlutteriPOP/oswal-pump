import 'package:flutter/material.dart';
import 'package:oswal/theme/color.dart';
import 'package:oswal/theme/fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: primaryColor, // Accent color as primary
    secondary: primaryColorLight, // Light variant of primary color
    onPrimary: Colors.white, // Text and icons on primary color
    onSecondary: Colors.black, // Text on background color
    surface: Colors.white, // Surface color (e.g., card backgrounds)
    onSurface: primaryColorDark, // Text on surface color
    error: Colors.red, // Error color
    onError: Colors.white, // Text on error color
  ),
  scaffoldBackgroundColor: Colors.white, // Background color for scaffold
  inputDecorationTheme: inputDecorationTheme,
  textTheme: textTheme,
);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  labelStyle: const TextStyle(
    color: primaryColor,
  ),
  hintStyle: const TextStyle(
    color: primaryColorDark, // Ensuring hint text is visible
  ),
  border: OutlineInputBorder(
    borderSide: const BorderSide(
      color: primaryColor,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 2,
      color: primaryColor,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 2,
      color: primaryColor,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 2,
      color: errorColor,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 2,
      color: errorColor,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  errorStyle: const TextStyle(
    color: errorColor,
    fontWeight: FontWeight.w400,
  ),
);
