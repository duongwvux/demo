import 'package:core/color/font_color.dart';
import 'package:flutter/material.dart';

import 'app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = _build(
      brightness: Brightness.light,
      background: FontColor.background()
  );

  static final ThemeData dark = _build(
      brightness: Brightness.dark,
      background: FontColor.background()
  );

  static ThemeData _build({
    required Brightness brightness,
    required Color background,
    TextTheme? textTheme
  }) {
    final colors = ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: brightness,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colors,
      scaffoldBackgroundColor: background,
      textTheme: textTheme ?? AppTextTheme.build(colors),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: colors.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
