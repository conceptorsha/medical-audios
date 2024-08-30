import 'package:flutter/material.dart';

class AppTheme {
  static const Color orange = Color(0xFFFF5722); // Bright orange
  static const Color lightOrange = Color(0xFFFFC107); // Light orange
  static const Color dullOrange = Color(0xFFFFA500); // Dull orange

  static final ThemeData theme = ThemeData(
    primarySwatch: Colors.orange,
    hintColor: Colors.orange,
    buttonTheme: ButtonThemeData(
      buttonColor: orange, // Default button color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: orange, // Default ElevatedButton color
        minimumSize: const Size(double.infinity, 50), // Full width
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16.0),
      bodyMedium: TextStyle(fontSize: 14.0),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );

  static ThemeData get themeData {
    return theme.copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: orange, // Default button color
        ),
      ),
    );
  }
}
