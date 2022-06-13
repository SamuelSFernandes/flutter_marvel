import 'package:flutter/material.dart';

ThemeData appThemes = ThemeData(
  fontFamily: 'badaboom',
  primaryColor: Colors.black,
  textTheme: const TextTheme(
    headline3: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 20, fontFamily: 'heycomic'),
    subtitle2: TextStyle(
      color: Colors.white,
      fontFamily: 'badaboom',
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF202020),
    centerTitle: true,
  ),
);
