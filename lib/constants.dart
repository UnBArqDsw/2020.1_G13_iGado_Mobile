import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum UserRole { owner, employee }
enum BovineRole { beefCattle, dairyCattle }
// Colors
Color kBrown1 = Color(0xFFC97946);
Color kBrown2 = Color(0xFFAD7B56);
Color kDisabledButtonColor = Color(0xFFC8C8C8);
Color kBege1 = Color(0xFFEFC19D);
//Styles
Decoration kBackgroundTheme = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      kBege1,
    ],
  ),
);

InputDecoration kInputFormStyle = InputDecoration(
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

// Texts and icons
// List<IconData> icons = [
//   Icons.person_outline,
//   Icons.calendar_today,
//   Icons.mail_outline,
//   Icons.mail_outline,
//   Icons.lock_outline,
//   Icons.lock_outline,
// ];
// images

String kLogo = 'assets/images/logo.png';
