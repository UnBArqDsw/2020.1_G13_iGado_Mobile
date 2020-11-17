import 'package:flutter/material.dart';
import 'package:igado_front/components/dropdown_icon_text.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/components/visibility_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/management_service.dart';
import 'package:igado_front/utils/alert_utils.dart';

class ReproductionManagementScreen extends StatefulWidget {
  final int bovineId;

  ReproductionManagementScreen({@required this.bovineId});
  @override
  _ReproductionManagementScreenState createState() =>
      _ReproductionManagementScreenState();
}

class _ReproductionManagementScreenState
    extends State<ReproductionManagementScreen> {
  ReproductionManagementRole role = ReproductionManagementRole.naturalMount;
  bool isNaturalMount = true;
  bool isInsemination = false;
  Map<String, dynamic> data;
  var response;

  Map<String, dynamic> managementData = {
    "bovine_id": "",
    "type": "reproduction_management",
    "bull_breed": "",
    "reproduction_type": "",
    "insemination_amount": "0",
    "insemination_period": "Manhã",
  };

  bool checkFormResponse(formResponse) {
    if (formResponse["bull_breed"].isEmpty ||
        (formResponse["reproduction_type"] == "insemination" &&
            (formResponse["insemination_amount"].isEmpty ||
                formResponse["insemination_period"].isEmpty))) {
      return false;
    }
    return true;
  }

  Function changeDictData(String field) {
    return (text) {
      setState(() {
        managementData[field] = text;
      });
    };
  }

  @override
  void initState() {
    super.initState();
    managementData["bovine_id"] = widget.bovineId;
  }

  String dropdownValue = 'Manhã';
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconTextFormField(
                  title: "Raça do Touro",
                  icon: Icons.pets,
                  placeholder: "Digite a raça do touro",
                  obscureText: false,
                  onChange: changeDictData('bull_breed'),
                ),
                Text(
                  "Tipo de Reprodução",
                  style: TextStyle(
                    color: kBrown1,
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  alignment: Alignment.topLeft,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text('Monta Natural'),
                    leading: Radio(
                      activeColor: kBrown1,
                      value: ReproductionManagementRole.naturalMount,
                      groupValue: role,
                      onChanged: (ReproductionManagementRole value) {
                        setState(() {
                          role = value;
                          isNaturalMount = true;
                          isInsemination = false;
                        });
                      },
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  alignment: Alignment.topLeft,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text('Inseminação Artificial'),
                    leading: Radio(
                      activeColor: kBrown1,
                      value: ReproductionManagementRole.insemination,
                      groupValue: role,
                      onChanged: (ReproductionManagementRole value) {
                        setState(() {
                          role = value;
                          isNaturalMount = false;
                          isInsemination = true;
                        });
                      },
                    ),
                  ),
                ),
                VisibilityFormField(
                  isVisible: isInsemination,
                  title: "Quantidade de Inseminações",
                  onChange: changeDictData("insemination_amount"),
                  placeholder: "Quantidade de Inseminações",
                ),
                Visibility(
                  visible: isInsemination,
                  child: DropdownIconText(
                    icon: Icons.calendar_today,
                    title: "Período da Inseminação",
                    changeDictData: (String value){
                      setState(() {
                        managementData['insemination_period'] = [ value ];
                      });
                      print(managementData['insemination_period']);
                    },
                    dropdownValue: 'Manhã',
                    values: ['Manhã', 'Tarde', 'Noite'],
                  ),
                ),
                FlatButton(
                  onPressed: checkFormResponse(managementData)
                      ? () {
                          setState(() {
                            managementData["reproduction_type"] = (role ==
                                      ReproductionManagementRole.naturalMount
                                  ? "natural mount"
                                  : "insemination");
                          });
                          print(managementData);
                          response = ManagementService()
                              .performManagement(managementData)
                              .then((value) {
                            showAlert(
                              "Manejo reprodutivo realizado com sucesso!",
                              context,
                              () {
                                Navigator.pushNamed(context, '/');
                              },
                            );
                          }).catchError((e) {
                            print(e);
                            showAlert(
                              "Opa, não foi possível realizar o Manejo Reprodutivo",
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
              ],
            ),
          ),
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
    );
  }
}
