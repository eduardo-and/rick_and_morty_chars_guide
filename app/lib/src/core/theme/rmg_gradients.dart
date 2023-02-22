import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_guide/src/core/theme/rmg_colors_dark.dart';
import 'package:rick_and_morty_guide/src/core/theme/rmg_colors_light.dart';

class RMGGradients {
  static LinearGradient lightGreenSplashBackground = LinearGradient(
    colors: [RMGColorsLight().primary, const Color(0xffA0D262)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient darkGreenSplashBackground = LinearGradient(
    colors: [RMGColorsDark().primary, const Color(0xff151D0A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient lightGreenBackground = LinearGradient(
    colors: [const Color(0xffA0D262), RMGColorsLight().primary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient lightPurpleBackground = LinearGradient(
    colors: [const Color(0xff9A64DE), RMGColorsLight().secundary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient darkGreenBackground = LinearGradient(
    colors: [const Color(0xff181C13), RMGColorsDark().primary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient darkPurpleBackground = LinearGradient(
    colors: [const Color(0xff211234), RMGColorsDark().secundary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static RadialGradient glassmorphism = RadialGradient(
      colors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.25)],
      center: Alignment.topLeft,
      radius: 2);
  static RadialGradient glassmorphismDark = RadialGradient(colors: [
    const Color(0xff5E5D5D),
    const Color(0xff524747).withOpacity(0.20)
  ], center: Alignment.topLeft, radius: 2);
}
