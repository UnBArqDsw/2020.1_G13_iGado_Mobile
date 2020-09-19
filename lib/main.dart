import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iGado',
      theme: ThemeData(
        primaryColor: Color(0xFFAD7B56),
      ),
      home: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFFFFFF), Color(0xFFEFC19D)]),
        ),
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
