import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:igado_front/screens/data_bovine_screen.dart';
=======
import 'package:igado_front/screens/main_screen.dart';
>>>>>>> b5aa5d0ca4745ea011e3dee27dea28659da6def6
import 'package:igado_front/screens/register_screen.dart';
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
  '/databovine': (context) => DataBovineScreen(),
};
