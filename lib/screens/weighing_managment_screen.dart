import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/management_service.dart';
import 'package:igado_front/utils/alert_utils.dart';

class WeighingManagmentScreen extends StatefulWidget {
  int bovineId;

  WeighingManagmentScreen({@required this.bovineId});
  @override
  _WeighingManagmentScreenState createState() =>
      _WeighingManagmentScreenState();
}

class _WeighingManagmentScreenState extends State<WeighingManagmentScreen> {
  Map<String, dynamic> managementData = {
    "actual_weight": "",
    "date_of_actual_weighing": "",
    "bovine_id": "",
    "type": "weighing_management" 
  };
  List<Map<String, dynamic>> formInfoList = [
    {
      "title": "Peso",
      "icon": MaterialCommunityIcons.weight_kilogram,
      "placeholder": "Digite o peso atual do bovino",
      "obscureText": false,
      "onChange": "actual_weight",
    }
  ];
  var response;
  @override
  void initState() {
    super.initState();
    managementData["bovine_id"] = widget.bovineId;
  }

  bool checkFormResponse(formResponse) {
    return !formResponse["actual_weight"].isEmpty;
  }

  Function changeDictData(String field) {
    return (text) {
      setState(() {
        managementData[field] = text;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: formInfoList.map((Map<String, dynamic> formInfo) {
              return IconTextFormField(
                title: formInfo["title"],
                icon: formInfo["icon"],
                placeholder: formInfo["placeholder"],
                obscureText: formInfo["obscureText"],
                onChange: changeDictData(formInfo["onChange"]),
              );
            }).toList(),
          ),
          FlatButton(
            onPressed: checkFormResponse(managementData)
                ? () {
                    response = ManagementService()
                        .performManagement(managementData)
                        .then((value) => showAlert(
                              "Manejo realizado com sucesso.",
                              context,
                              null,
                            ))
                        .catchError((e) {
                      print(e);
                      showAlert(
                        "Opa, não foi possível realizar seu manejo, verifique seus dados ou tente novamente mais tarde.",
                        context,
                        null,
                      );
                    });
                  }
                : null,
            child: Text(
              'Manejar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: kBrown2,
            disabledColor: kDisabledButtonColor,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              'Cancelar',
              style: TextStyle(color: kBrown1),
            ),
          ),
        ],
      ),
    );
  }
}
