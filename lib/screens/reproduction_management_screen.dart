import 'package:flutter/material.dart';
import 'package:igado_front/components/dropdown_icon_text.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/components/visibility_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/reproduction_management_service.dart';
import 'package:igado_front/utils/alert_utils.dart';

ReproductionManagementService reproductionManagemenetService =
    new ReproductionManagementService();

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

  Map<String, dynamic> formResponse = {
    "bovineId": "",
    "bullBreed": "",
    "bullId": "",
    "reproductionType": "",
    "inseminationAmount": "",
    "inseminationPeriod": "Manhã",
  };

  bool checkFormResponse(formResponse) {
    if (formResponse["bullBreed"].isEmpty ||
        (formResponse["reproductionType"] == "insemination" &&
            (formResponse["inseminationAmount"].isEmpty ||
                formResponse["insemiationPeriod"].isEmpty))) {
      return false;
    }
    return true;
  }

  Function changeDictData(String field) {
    return (text) {
      setState(() {
        formResponse[field] = text;
      });
    };
  }

  @override
  void initState() {
    super.initState();
    formResponse["bovineId"] = widget.bovineId;
  }

  String dropdownValue = 'Manhã';
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                    onChange: changeDictData('bullBreed'),
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
                    onChange: changeDictData("inseminationAmount"),
                    placeholder: "Quantidade de Inseminações",
                  ),
                  Visibility(
                    visible: isInsemination,
                    child: DropdownIconText(
                      icon: Icons.calendar_today,
                      title: "Período da Inseminação",
                      changeDictData: changeDictData("inseminationPeriod"),
                      dropdownValue: 'Manhã',
                      values: ['Manhã', 'Tarde', 'Noite'],
                    ),
                  ),
                  FlatButton(
                    onPressed: checkFormResponse(formResponse)
                        ? () {
                            setState(() {
                              data = {
                                "bovine_id": 1,
                                "bull_breed": formResponse["bullBreed"],
                                "reproduction_type": role ==
                                        ReproductionManagementRole.naturalMount
                                    ? "natural mount"
                                    : "insemination",
                                "insemination_amount": isInsemination
                                    ? formResponse["inseminationAmount"]
                                    : false,
                                "insemination_period": isInsemination
                                    ? [formResponse["inseminationPeriod"]]
                                    : false
                              };
                              response = reproductionManagemenetService
                                  .performReproductionManagement(data)
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
      ),
    );
  }
}
