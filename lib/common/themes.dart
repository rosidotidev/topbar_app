import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
final Map<String, ThemeData> THM = {
  "BASE": ThemeData(
    scaffoldBackgroundColor: Colors.grey[50],
    primaryColor: Colors.deepOrange[300],
    primaryColorLight: Colors.deepOrange[200],
    primaryColorDark: Colors.deepOrange[400],
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  "LIGHT": ThemeData.light(),
  "BLACK1": ThemeData(
    scaffoldBackgroundColor: Colors.grey[50],
    primaryColor: Colors.black,
    primaryColorLight: Colors.black54,
    primaryColorDark: Colors.black54,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  "ARMY": ThemeData(
    scaffoldBackgroundColor: Colors.grey[50],
    primaryColor: createMaterialColor(Color(0xFF808000)),
    primaryColorLight: Colors.black54,
    primaryColorDark: Colors.black54,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  "MARTA": ThemeData(
    scaffoldBackgroundColor: Colors.grey[50],
    primaryColor: createMaterialColor(Colors.amber),
    primaryColorLight: Colors.black54,
    primaryColorDark: Colors.deepOrange[300],
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  "ALICE": ThemeData(
    scaffoldBackgroundColor: Colors.grey[50],
    primaryColor: createMaterialColor(Colors.pink),
    primaryColorLight: Color(0xFFF4F4F4),
    primaryColorDark: Color(0xFF6397D0),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  // "ARMY": ThemeData(
  //   primarySwatch: createMaterialColor(Color(0xFF808000)),
  // ),
  "RED": ThemeData(
    primarySwatch: Colors.red,
  ),
  "AMBER": ThemeData(
    primarySwatch: Colors.amber,
  ),
  "GREEN": ThemeData(
    primarySwatch: Colors.green,
  ),
  "PURPLE": ThemeData(
    primarySwatch: Colors.purple,
  ),
  "PINK": ThemeData(
    primarySwatch: Colors.pink,
  ),
  "LIME": ThemeData(
    primarySwatch: Colors.lime,
  ),
};

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
