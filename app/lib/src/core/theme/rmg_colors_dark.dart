import 'dart:ui';

import 'package:flutter/material.dart';

import 'i_rmg_colors.dart';

class RMGColorsDark implements IRMGColors {
  @override
  Color get background => const Color(0xFF252424);

  @override
  Color get emphasisBackground => const Color(0xFFF4F4F4);

  @override
  Color get primary => const Color(0xFF0D1206);

  @override
  Color get secundary => const Color(0xFF140B1F);

  @override
  Color get tertiary => const Color(0xFF252424);

  @override
  Color get text => const Color(0xFFF4F4F4);

  @override
  Color get textSecundary => const Color(0xFFC5C5C5);

  @override
  Color get complementary => const Color(0xFF486623);
  
  @override
  Color get inputFillColor => const Color(0xFF292929);

  @override 
  final MaterialColor black = const MaterialColor(
    0xFF1D1F23,
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
