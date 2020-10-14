import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';

Map<String, WidgetBuilder> kRoutes = {
  '/': (context) => SplashScreen(),
  '/login': (context) => LoginPage(),
};
