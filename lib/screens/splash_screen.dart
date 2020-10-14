import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBackgroundTheme,
        child: Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: 300,
          ),
        ),
      ),
    );
  }
}
