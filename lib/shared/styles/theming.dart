import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third/shared/styles/text_styles.dart';
import 'colors.dart';
class Theming {
  static ThemeData lightTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:MainColors.secondryLightColor ),

    iconTheme: IconThemeData(color: MainColors.whited),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: MainColors.primaryLightColor,
        onPrimary: Colors.white,
        secondary: MainColors.secondryLightColor,
        onSecondary: MainColors.secondryLightColor,
        error: MainColors.lightbottomnav,
        onError: MainColors.primaryLightColor,
        background: MainColors.primaryLightColor,
        onBackground: MainColors.secondryLightColor,
        surface: MainColors.primaryLightColor,
        onSurface: Colors.white,
        onErrorContainer: Colors.black
    ),
    textTheme: TextStyles.lightTextTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: MainColors.secondryLightColor,
      unselectedItemColor:Color(0xffc8c9cb),
      selectedIconTheme: IconThemeData(size: 40,color:  MainColors.secondryLightColor),
      unselectedIconTheme: IconThemeData(size: 35,color:  Color(0xffc8c9cb)),
      selectedLabelStyle: GoogleFonts.elMessiri(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: MainColors.primaryLightColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black, size: 35),
      titleTextStyle: GoogleFonts.elMessiri(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: MainColors.secondryLightColor),
      color: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:MainColors.secondryLightColor ),
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: MainColors.secondrydarkColor,
        onPrimary: MainColors.primarydarkColor,
        secondary: MainColors.primarydarkColor,
        onSecondary: MainColors.secondrydarkColor,
        error: MainColors.darkbottomnav,
        onError: MainColors.primarydarkColor,
        background: MainColors.secondrydarkColor,
        onBackground: Colors.white,
        surface: MainColors.secondrydarkColor,
        onSurface: MainColors.secondrydarkColor,
        onErrorContainer: MainColors.whited
    ),
    textTheme: TextStyles.darkTextTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor:  MainColors.secondryLightColor,
      unselectedItemColor: Color(0xffc8c9cb),
      selectedIconTheme: IconThemeData(size: 35),
      unselectedIconTheme: IconThemeData(size: 35),
      selectedLabelStyle: GoogleFonts.elMessiri(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: MainColors.primarydarkColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white, size: 35),
      titleTextStyle: GoogleFonts.elMessiri(
          fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
      color: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
  );
}