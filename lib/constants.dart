import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'splash.dart';

import 'login.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => SplashScreen(),
  '/login': (context) => LoginPage(),
};

Decoration backgroundTheme = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFEFC19D),
    ],
  ),
);

InputDecoration inputFormStyle = InputDecoration(
  hintStyle: TextStyle(
    color: Color(0xFFAAAAAA),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide.none,
  ),
  fillColor: Color(0xFFEBEBEB),
  filled: true,
);

Color brown1 = Color(0xFFC97946);
Color brown2 = Color(0xFFAD7B56);
