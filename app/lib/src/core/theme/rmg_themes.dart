import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/extensions/numbers_extension.dart';
import 'rmg_colors_dark.dart';
import 'rmg_colors_light.dart';
import 'rmg_fonts.dart';
import 'rmg_icons.dart';

abstract class RMGThemes {
  static ThemeData get dark {
    return customTheme(
      brightness: Brightness.light,
      primary: RMGColorsDark().primary,
      primaryVariant: RMGColorsDark().primary,
      onPrimary: RMGColorsDark().background,
      secondary: RMGColorsDark().secundary,
      secondaryVariant: RMGColorsDark().secundary,
      onSecondary: RMGColorsDark().background,
      background: RMGColorsDark().background,
      scaffoldBackground: RMGColorsDark().background,
      onBackground: RMGColorsDark().text,
      surface: RMGColorsDark().emphasisBackground,
      onSurface: RMGColorsDark().text,
      tertiary: RMGColorsDark().tertiary,
      error: RMGColorsDark().text,
      onError: RMGColorsDark().background,
      secundaryFontColor: RMGColorsDark().textSecundary,
      disabledColor: RMGColorsDark().text,
      dividerColor: RMGColorsDark().primary,
      dialogBackgroundColor: RMGColorsDark().background,
      bottomNavigationBarBackgroundColor: RMGColorsDark().emphasisBackground,
      inputFillColor: RMGColorsDark().inputFillColor,
      appBarBackgroundColor: RMGColorsDark().background,
      fontColor: RMGColorsDark().text,
      primarySwatch: RMGColorsDark().black,
    );
  }

  static ThemeData get light {
    return customTheme(
      brightness: Brightness.light,
      primary: RMGColorsLight().primary,
      primaryVariant: RMGColorsLight().primary,
      onPrimary: RMGColorsLight().background,
      secondary: RMGColorsLight().secundary,
      secondaryVariant: RMGColorsLight().secundary,
      onSecondary: RMGColorsLight().background,
      tertiary: RMGColorsLight().tertiary,
      background: RMGColorsLight().background,
      scaffoldBackground: RMGColorsLight().background,
      secundaryFontColor: RMGColorsLight().textSecundary,
      onBackground: RMGColorsLight().text,
      surface: RMGColorsLight().emphasisBackground,
      onSurface: RMGColorsLight().text,
      error: RMGColorsLight().text,
      onError: RMGColorsLight().background,
      disabledColor: RMGColorsLight().text,
      dividerColor: RMGColorsLight().primary,
      dialogBackgroundColor: RMGColorsLight().background,
      bottomNavigationBarBackgroundColor: RMGColorsLight().emphasisBackground,
      inputFillColor: RMGColorsLight().inputFillColor,
      appBarBackgroundColor: RMGColorsLight().background,
      fontColor: RMGColorsLight().text,
      primarySwatch: RMGColorsLight().black,
    );
  }

  static ThemeData customTheme({
    required Brightness brightness,
    // Primary
    required Color primary,
    required Color primaryVariant,
    required Color onPrimary,
    // Secondary
    required Color secondary,
    required Color secondaryVariant,
    required Color tertiary,
    required Color onSecondary,
    // Background
    required Color background,
    required Color scaffoldBackground,
    required Color onBackground,
    // Surface
    required Color surface,
    required Color onSurface,
    // Error
    required Color error,
    required Color onError,
    // Misc
    required Color disabledColor,
    required Color dividerColor,
    required Color dialogBackgroundColor,
    required Color bottomNavigationBarBackgroundColor,
    required Color appBarBackgroundColor,
    required Color inputFillColor,
    required Color fontColor,
    required Color secundaryFontColor,
    required MaterialColor primarySwatch,
  }) {
    return ThemeData(
      brightness: brightness,
      primarySwatch: primarySwatch,
      primaryColor: primary,
      primaryColorLight: RMGColorsLight().complementary,
      primaryColorDark: primaryVariant,
      backgroundColor: background,
      scaffoldBackgroundColor: scaffoldBackground,
      cardColor: surface,
      disabledColor: disabledColor,
      dividerColor: dividerColor,
      dialogBackgroundColor: dialogBackgroundColor,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        secondary: secondary,
        tertiary: tertiary,
        background: background,
        surface: surface,
        error: error,
        onBackground: fontColor,
        onPrimary: onPrimary,
        onSecondary: onSecondary,
        onError: onError,
        onSurface: onSurface,
      ),
      fontFamily: RMGFonts.jockeyOne,
      primaryTextTheme: const TextTheme(),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 98.scale,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
            color: fontColor),
        headline2: TextStyle(
            fontSize: 61.scale,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
            color: fontColor),
        headline3: TextStyle(fontSize: 35.scale, color: fontColor),
        headline4: TextStyle(
            fontSize: 30.scale,
            fontFamily: RMGFonts.roboto,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFF4F4F4)),
        headline5: TextStyle(
            fontSize: 24.scale, fontWeight: FontWeight.w500, color: fontColor),
        headline6: TextStyle(
            fontSize: 20.scale,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: fontColor),
        subtitle1: TextStyle(fontSize: 20.scale, color: fontColor),
        subtitle2: TextStyle(fontSize: 20.scale, color: fontColor),
        bodyText1: TextStyle(
            fontSize: 20.scale,
            fontWeight: FontWeight.w400,
            fontFamily: RMGFonts.roboto,
            color: secundaryFontColor),
        bodyText2: TextStyle(fontSize: 20.scale, color: fontColor),
        button: TextStyle(fontSize: 15.scale, color: fontColor),
        caption: TextStyle(
            fontSize: 13.scale,
            fontFamily: RMGFonts.roboto,
            fontWeight: FontWeight.w500,
            color: secundaryFontColor),
        overline: TextStyle(
            fontSize: 10.scale,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            color: fontColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFillColor,
        hintStyle: TextStyle(
            fontSize: 13.scale,
            fontWeight: FontWeight.w400,
            fontFamily: RMGFonts.roboto,
            color: fontColor.withOpacity(0.5)),
        contentPadding: const EdgeInsets.only(
          left: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.scale),
        ),
        disabledColor: disabledColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackgroundColor,
        foregroundColor: primary,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 20.scale,
          fontWeight: FontWeight.w500,
          color: fontColor,
          fontFamily: RMGFonts.jockeyOne,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appBarBackgroundColor,
          statusBarIconBrightness: brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,
          statusBarBrightness: brightness,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all<Color>(onPrimary),
        fillColor: MaterialStateProperty.all<Color>(primary),
      ),
      iconTheme: IconThemeData(
        color: fontColor,
        size: 24.scale,
      ),
      primaryIconTheme: IconThemeData(
        color: fontColor,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(secondary),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.scale),
        ),
        elevation: brightness == Brightness.light ? 4.0 : 0.0,
        shadowColor: primary.withOpacity(.2),
        color: surface,
        margin: EdgeInsets.zero,
      ),
    );
  }
}
