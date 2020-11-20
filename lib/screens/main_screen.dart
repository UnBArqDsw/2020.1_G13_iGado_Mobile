import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/screens/cattle_screen.dart';
import 'package:igado_front/screens/profile_screen.dart';
import 'package:igado_front/screens/report_screen.dart';
import 'package:igado_front/screens/splash_screen.dart';
import 'package:igado_front/utils/destination.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  Destination destination;
  final tabs = [
    CattleScreen(),
    ReportScreen(),
    SplashScreen(),
    SplashScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrown2,
        automaticallyImplyLeading: false,
        title: Text(allDestinations[_currentIndex].title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBrown2,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          color: kBege1,
        ),
        selectedItemColor: kBege1,
        currentIndex: _currentIndex,
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            title: Text(destination.title),
          );
        }).toList(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: kBackgroundTheme,
        child: tabs[_currentIndex],
      ),
    );
  }
}
