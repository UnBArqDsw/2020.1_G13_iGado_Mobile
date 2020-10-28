import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/screens/login_screen.dart';
import 'package:igado_front/screens/profile_screen.dart';
import 'package:igado_front/screens/register_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final tabs = [
    ProfileScreen(),
    RegisterScreen(),
    LoginPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrown2,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBrown2,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          color: kBege1,
        ),
        selectedItemColor: kBege1,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Início'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Relatório'),
          ),
        ],
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
