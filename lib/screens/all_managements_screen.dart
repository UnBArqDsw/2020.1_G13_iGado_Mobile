import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/screens/reproduction_management_screen.dart';
import 'package:igado_front/screens/weighing_managment_screen.dart';

class AllManagementsScreen extends StatefulWidget {
  final int bovineId;
  AllManagementsScreen({@required this.bovineId});
  @override
  _AllManagementsScreenState createState() => _AllManagementsScreenState();
}

class _AllManagementsScreenState extends State<AllManagementsScreen> {
  List<Widget> managements = [];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    managements.add(WeighingManagmentScreen(bovineId: widget.bovineId));
    managements.add(ReproductionManagementScreen(bovineId: widget.bovineId,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrown2,
        automaticallyImplyLeading: false,
        title: Text('Realizar Manejo'),
      ),
      body: 
    );
  }
}