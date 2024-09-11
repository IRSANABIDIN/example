import 'package:flutter/material.dart';

final theme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 255, 0, 0),
    foregroundColor: Colors.white,
     titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
      foregroundColor: Colors.white,
    ),
  ),
 );