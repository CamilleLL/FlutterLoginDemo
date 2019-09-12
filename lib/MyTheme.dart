import 'package:flutter/material.dart';

const PrimaryColor = const Color(0xFF008080); 
const PrimaryColorLight = const Color(0xFF4cb0af);
const PrimaryColorDark = const Color(0xFF005354);

const SecondaryColor = const Color(0xFFb2dfdb);
const SecondaryColorLight = const Color(0xFFe5ffff);
const SecondaryColorDark = const Color(0xFF82ada9);

const Background = const Color(0xFFfffdf7);
const DarkBackground = const Color(0xFF222727);

const TextColor = const Color(0xFF004d40);

class MyTheme {
  static final ThemeData defaultTheme = _buildLightTheme();
  static final ThemeData darkTheme = _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData(fontFamily: 'DayRoman');

    return base.copyWith(
      accentColor: SecondaryColor,
      accentColorBrightness: Brightness.dark,
      
      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryColorDark,
      primaryColorLight: PrimaryColorLight,
      primaryColorBrightness: Brightness.dark,

      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: SecondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      
      scaffoldBackgroundColor: Background,
      cardColor: Background,
      textSelectionColor: PrimaryColorLight,
      backgroundColor: Background,
      
      textTheme: base.textTheme.copyWith(
        title: base.textTheme.title.copyWith(color: TextColor),
        body1: base.textTheme.body1.copyWith(color: TextColor),
        body2: base.textTheme.body2.copyWith(color: TextColor)
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      accentColor: SecondaryColor,
      accentColorBrightness: Brightness.dark,
      
      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryColorDark,
      primaryColorLight: PrimaryColorLight,
      primaryColorBrightness: Brightness.dark,

      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: SecondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      
      scaffoldBackgroundColor: DarkBackground,
      cardColor: DarkBackground,
      textSelectionColor: PrimaryColorLight,
      backgroundColor: Background,
      
      textTheme: base.textTheme.copyWith(
        title: base.textTheme.title.copyWith(color: TextColor),
        body1: base.textTheme.body1.copyWith(color: TextColor),
        body2: base.textTheme.body2.copyWith(color: TextColor)
      ),
    );
  }
}