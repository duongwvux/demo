import 'package:flutter/material.dart';
import '../color/text_color.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme base = TextTheme(
    headlineLarge: TextStyle(
      color: TextColor.textPrimary(),
      fontWeight: FontWeight.w600,
      fontSize: 48,
      height: 57/48,
    ),
    headlineMedium: TextStyle(
      color: TextColor.textPrimary(),
      fontSize: 36,
      fontWeight: FontWeight.w500,
      height: 43/36,
    ),
    headlineSmall: TextStyle(
        color: TextColor.textPrimary(),
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 19/16
    ),
    bodyLarge: TextStyle(
      color: TextColor.priceUp(),
      fontSize: 18,
      height: 21/18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      color: TextColor.textPrimary(),
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 17/14,
    ),
    bodySmall: TextStyle(
      color: TextColor.textSecondary(),
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 14/12,
    ),
  );
  static TextTheme build(ColorScheme colors) {
    return base.apply(
      bodyColor: colors.onSurface,
      displayColor: colors.onSurface
    );
  }
}