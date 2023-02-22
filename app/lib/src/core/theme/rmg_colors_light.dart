import 'dart:ui';

import 'package:flutter/material.dart';

import 'i_rmg_colors.dart';

class RMGColorsLight implements IRMGColors {
  @override
  Color get background => const Color(0xFFF4F4F4);

  @override
  Color get emphasisBackground => const Color(0xFF252525);

  @override
  Color get primary => const Color(0xFF89C341);

  @override
  Color get secundary => const Color(0xFF7B41C3);

  @override
  Color get tertiary => const Color(0xFFF4F4F4);

  @override
  Color get text => const Color(0xFF252525);

  @override
  Color get textSecundary => const Color(0xFF4E4E4E);

  @override
  Color get complementary => const Color(0xFF6E9F32);

  @override
  Color get inputFillColor => tertiary;

  @override
  final MaterialColor black = const MaterialColor(
    0xFF252525,
    <int, Color>{
      50: Color(0xFFE4E4E5),
      100: Color(0xFFBBBCBD),
      200: Color(0xFF8E8F91),
      300: Color(0xFF616265),
      400: Color(0xFF3F4144),
      500: Color(0xFF1D1F23),
      600: Color(0xFF1A1B1F),
      700: Color(0xFF15171A),
      800: Color(0xFF111215),
      900: Color(0xFF0A0A0C),
    },
  );
}
