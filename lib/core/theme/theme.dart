import 'package:custom_numpad/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

ThemeData brightTheme = ThemeData().copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: BrightnessColors.primaryColor),
  scaffoldBackgroundColor: BrightnessColors.backgroundColor,
  iconTheme: IconThemeData(color: BrightnessColors.primaryColor),
  brightness: Brightness.light,
  primaryColor: BrightnessColors.primaryColor,
  primaryColorDark: BrightnessColors.primaryDark,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: BrightnessColors.primaryColor,
    unselectedItemColor: BrightnessColors.textColorLight,
    selectedLabelStyle: GoogleFonts.nunito(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: BrightnessColors.primaryColor,
    ),
    unselectedLabelStyle: GoogleFonts.nunito(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: BrightnessColors.textColorLight,
    ),
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),

  //textTheme
  textTheme: TextTheme(
    headlineSmall: GoogleFonts.nunito(
      fontSize: 16,
      color: BrightnessColors.textColor,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.nunito(
      fontSize: 18,
      color: BrightnessColors.textColor,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: GoogleFonts.nunito(
      fontSize: 22,
      color: BrightnessColors.textColor,
      fontWeight: FontWeight.w800,
    ),
    bodyMedium: GoogleFonts.nunito(color: BrightnessColors.textColorLight),
    bodySmall: GoogleFonts.nunito(
      color: BrightnessColors.textColorLight,
      fontSize: 14,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: BrightnessColors.textColorLight,
    ),
  ),

  //appBarTheme
  appBarTheme: AppBarTheme(
    centerTitle: true,
    shadowColor: Colors.transparent,
    titleTextStyle: GoogleFonts.nunito(
      color: BrightnessColors.black,
      fontWeight: FontWeight.bold,
    ),
    surfaceTintColor: Colors.transparent,
    color: BrightnessColors.backgroundColor,
    iconTheme: IconThemeData(color: BrightnessColors.black),
    foregroundColor: Colors.transparent,
  ),
);

ThemeData darkTheme = ThemeData().copyWith(
  iconTheme: IconThemeData(color: DarknessColors.primaryColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: const Color.fromARGB(255, 23, 24, 32),
    selectedItemColor: DarknessColors.primaryColor,
    unselectedItemColor: Colors.white.withOpacity(0.60),
    selectedLabelStyle: GoogleFonts.nunito(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: DarknessColors.primaryColor,
    ),
    unselectedLabelStyle: GoogleFonts.nunito(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Colors.white.withOpacity(0.70),
    ),
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: DarknessColors.primaryColor),
  brightness: Brightness.dark,
  primaryColor: DarknessColors.primaryColor,
  primaryColorDark: DarknessColors.primaryDark,
  scaffoldBackgroundColor: DarknessColors.backgroundColor,
  textTheme: TextTheme(
    headlineSmall: GoogleFonts.nunito(
      fontSize: 16,
      color: Colors.white.withOpacity(0.87),
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.nunito(
      fontSize: 18,
      color: Colors.white.withOpacity(0.87),
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: GoogleFonts.nunito(
      fontSize: 22,
      color: Colors.white.withOpacity(0.87),
      fontWeight: FontWeight.w800,
    ),
    bodyMedium: GoogleFonts.nunito(color: Colors.white.withOpacity(0.70)),
    bodySmall: GoogleFonts.nunito(
      color: Colors.white.withOpacity(0.70),
      fontSize: 16,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white.withOpacity(0.87),
    ),
  ),
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.white),
    shadowColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: GoogleFonts.nunito(
      color: Colors.white.withOpacity(0.87),
      fontWeight: FontWeight.bold,
    ),
    surfaceTintColor: Colors.transparent,
    color: DarknessColors.backgroundColor,
    foregroundColor: Colors.transparent,
  ),
);

final CupertinoThemeData cupertino_bright = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: BrightnessColors.primaryColor,
  scaffoldBackgroundColor: BrightnessColors.backgroundColor,
  barBackgroundColor: BrightnessColors.backgroundColor,
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      color: BrightnessColors.textColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    actionTextStyle: TextStyle(
      color: BrightnessColors.primaryColor,
      fontWeight: FontWeight.w600,
    ),
    navTitleTextStyle: TextStyle(
      color: BrightnessColors.textColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    navLargeTitleTextStyle: TextStyle(
      color: BrightnessColors.textColor,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    navActionTextStyle: TextStyle(
      color: BrightnessColors.textColorLight,
      fontSize: 14,
    ),
    tabLabelTextStyle: TextStyle(
      color: BrightnessColors.textColorLight,
      fontSize: 12,
    ),
  ),
);

final CupertinoThemeData cupertino_dark = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: DarknessColors.primaryColor,
  scaffoldBackgroundColor: DarknessColors.backgroundColor,
  barBackgroundColor: DarknessColors.backgroundColor,
  textTheme: CupertinoTextThemeData(
    textStyle: GoogleFonts.nunito(
      color: Colors.white.withOpacity(0.87),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    actionTextStyle: GoogleFonts.nunito(
      color: DarknessColors.primaryColor,
      fontWeight: FontWeight.w600,
    ),
    navTitleTextStyle: GoogleFonts.nunito(
      color: Colors.white.withOpacity(0.87),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    navLargeTitleTextStyle: GoogleFonts.nunito(
      color: Colors.white.withOpacity(0.87),
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    navActionTextStyle: GoogleFonts.nunito(
      color: Colors.white.withOpacity(0.60),
      fontSize: 14,
    ),
    tabLabelTextStyle: GoogleFonts.nunito(
      color: Colors.white.withOpacity(0.60),
      fontSize: 12,
    ),
  ),
);
