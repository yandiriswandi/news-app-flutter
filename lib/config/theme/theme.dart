import 'package:flutter/material.dart';

final themeData = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFF3498DB)),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);
