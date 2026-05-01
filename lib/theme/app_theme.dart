import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData build() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.ink,
      canvasColor: AppColors.ink,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.ink,
        onSurface: AppColors.bone,
        onSurfaceVariant: AppColors.mute,
        primary: AppColors.accent,
        onPrimary: AppColors.ink,
        outline: AppColors.border,
      ),
      dividerColor: AppColors.border,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.accent,
        selectionColor: Color(0x33FF6B47),
        selectionHandleColor: AppColors.accent,
      ),
      textTheme: TextTheme(
        displayLarge: AppType.display(),
        displayMedium: AppType.display(size: 40, height: 1.1),
        headlineMedium: AppType.heading(),
        bodyLarge: AppType.body(),
        bodyMedium: AppType.muted(),
        labelSmall: AppType.eyebrow(),
      ),
    );
  }
}
