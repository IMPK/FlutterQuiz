import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const colorPrimary = Color(0xFF9853DE);
  static const colorAccent = Color(0xFF612BD0);

  static final themeData = new ThemeData(
    brightness: Brightness.light,
    backgroundColor: colorPrimary,
    accentColor: colorAccent,
  );
}
