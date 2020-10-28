import 'package:flutter/material.dart';
import 'package:igado_front/screens/main_screen.dart';
import 'package:igado_front/screens/register_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';

Map<String, WidgetBuilder> kRoutes = {
  '/': (context) => MainScreen(),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterScreen(),
  '/profile': (context) => ProfileScreen(),
};
