import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/constants.dart';

class WeighingManagmentScreen extends StatefulWidget {
  @override
  _WeighingManagmentScreenState createState() =>
      _WeighingManagmentScreenState();
}

class _WeighingManagmentScreenState extends State<WeighingManagmentScreen> {
  List<Map<String, dynamic>> formInfoList = [
    {
      "title": "Peso",
      "icon": MaterialCommunityIcons.weight_kilogram,
      "placeholder": "Digite o peso atual do bovino",
      "obscureText": false,
      "onChange": null,
    },
    {
      "title": "Data da pesagem",
      "icon": Icons.calendar_today,
      "placeholder": "Digite a data que o bovino foi pesado",
      "obscureText": false,
      "onChange": null,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrown2,
        automaticallyImplyLeading: false,
        title: Text('Manejo'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: kBackgroundTheme,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Form(
            child: Column(
              children: [
                Column(
                  children: formInfoList.map((Map<String, dynamic> formInfo) {
                    return IconTextFormField(
                      title: formInfo["title"],
                      icon: formInfo["icon"],
                      placeholder: formInfo["placeholder"],
                      obscureText: formInfo["obscureText"],
                      onChange: formInfo["onChange"],
                    );
                  }).toList(),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Manejar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: kBrown2,
                  disabledColor: kDisabledButtonColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
