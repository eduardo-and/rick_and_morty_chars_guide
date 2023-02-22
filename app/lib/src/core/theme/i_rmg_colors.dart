import 'package:flutter/material.dart';

abstract class IRMGColors {
  final Color primary;
  final Color secundary;
  final Color tertiary;
  final Color background;
  final Color text;
  final Color textSecundary;
  final Color emphasisBackground;
  final Color complementary;
  final Color inputFillColor;
  final MaterialColor black;

  IRMGColors(
      {required this.primary,
      required this.secundary,
      required this.tertiary,
      required this.background,
      required this.complementary,
      required this.text,
      required this.textSecundary,
      required this.inputFillColor,
      required this.emphasisBackground,
      required this.black});
}
