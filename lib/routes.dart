import 'package:flutter/material.dart';
import 'package:igado_front/screens/data_bovine_screen.dart';
import 'package:igado_front/screens/main_screen.dart';
import 'package:igado_front/screens/register_screen.dart';
import 'package:igado_front/screens/cattle_screen.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/bovine_screen.dart';
import 'screens/data_bovine_screen.dart';

Map<String, WidgetBuilder> kRoutes = {
  '/': (context) => MainScreen(),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterScreen(),
  '/profile': (context) => ProfileScreen(),
  '/bovine': (context) => BovineScreen(),
  '/cattle': (context) => CattleScreen()
};
