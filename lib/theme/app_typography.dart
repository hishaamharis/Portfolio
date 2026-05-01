import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theme/app_colors.dart';

class AppType {
  AppType._();

  static TextStyle display({
    double size = 64,
    FontWeight weight = FontWeight.w500,
    Color color = AppColors.bone,
    double height = 1.05,
  }) =>
      GoogleFonts.fraunces(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
        letterSpacing: -0.5,
      );

  static TextStyle heading({
    double size = 24,
    FontWeight weight = FontWeight.w500,
    Color color = AppColors.bone,
  }) =>
      GoogleFonts.fraunces(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: 1.2,
      );

  static TextStyle body({
    double size = 16,
    Color color = AppColors.bone,
    double height = 1.5,
    FontWeight weight = FontWeight.w400,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        color: color,
        height: height,
        fontWeight: weight,
      );

  static TextStyle muted({
    double size = 14,
    Color color = AppColors.mute,
    double height = 1.5,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        color: color,
        height: height,
        fontWeight: FontWeight.w400,
      );

  static TextStyle mono({
    double size = 13,
    Color color = AppColors.mute,
    double letterSpacing = 0.4,
    FontWeight weight = FontWeight.w400,
  }) =>
      GoogleFonts.jetBrainsMono(
        fontSize: size,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: weight,
      );

  static TextStyle eyebrow({
    Color color = AppColors.accent,
  }) =>
      GoogleFonts.jetBrainsMono(
        fontSize: 11,
        color: color,
        letterSpacing: 1.6,
        fontWeight: FontWeight.w500,
      );

  static TextStyle signature({
    double size = 56,
    Color color = AppColors.accent,
  }) =>
      TextStyle(
        fontFamily: 'MonteCarlo',
        fontSize: size,
        color: color,
        height: 1.0,
      );
}
