import 'package:flutter/material.dart';

final Color primaryColor = Color(
  0xFF8D4E31,
); // Warna coklat untuk tema makanan tradisional
final Color secondaryColor = Color(
  0xFFFFB74D,
); // Warna oranye untuk aksen (pengganti accentColor)
final Color textColor = Color(0xFF3E2723); // Warna coklat tua untuk teks

final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: textColor,
  ),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Montserrat',
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    displayMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    displaySmall: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    bodyLarge: TextStyle(fontSize: 16.0, color: textColor),
    bodyMedium: TextStyle(fontSize: 14.0, color: textColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: primaryColor),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);
