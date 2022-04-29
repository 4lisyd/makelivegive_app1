import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: const Color(0xffe0ba7b),
    primaryColorDark: const Color(0xff424242),
    primaryColorLight: const Color(0xffffffff),
    backgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xffe0ba7b),
        fontSize: 35,
        fontFamily: 'Gotham',
        fontWeight: FontWeight.w900,
      ),
      headline2: TextStyle(
        color: Color(0xff424242),
        fontSize: 20,
        fontFamily: 'Gotham',
        fontWeight: FontWeight.w900,
      ),
      headline3: TextStyle(
        color: Color(0xff344955),
        fontSize: 20,
        fontFamily: 'Bangers',
        fontWeight: FontWeight.w900,
      ),
      bodyText1: TextStyle(
        color: Color(0xff424242),
        fontSize: 14,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w300,
        // shadows: [Shadow(color: Colors.white, blurRadius: 5)],
      ),
      bodyText2: TextStyle(
        color: Color(0xffe0ba7b),
        fontSize: 14,
        fontFamily: 'Roboto',
        // shadows: [Shadow(color: Colors.black54, blurRadius: 5)],
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffF9AA33)),
  );
}
