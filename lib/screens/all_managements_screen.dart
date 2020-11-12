import 'package:flutter/material.dart';
import 'package:igado_front/components/dropdown_icon_text.dart';
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
  Map<String, Widget> managements = {
    "Manejo de Pesagem": null,
    "Manejo de Reprodução": null,
  };
  String _currentIndex = "Manejo de Pesagem";

  @override
  void initState() {
    super.initState();
    managements["Manejo de Pesagem"] =
        WeighingManagmentScreen(bovineId: widget.bovineId);

    managements["Manejo de Reprodução"] =
        ReproductionManagementScreen(bovineId: widget.bovineId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrown2,
        title: Text(_currentIndex),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: kBackgroundTheme,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              children: [
                DropdownIconText(
                  icon: Icons.calendar_today,
                  title: 'Manejo a ser realizado',
                  changeDictData: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  dropdownValue: 'Manejo de Pesagem',
                  values: ['Manejo de Pesagem', 'Manejo de Reprodução'],
                ),
                managements[_currentIndex],
              ],
            ),
          )),
    );
  }
}
