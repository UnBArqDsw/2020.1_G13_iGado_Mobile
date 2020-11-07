import 'package:flutter/material.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/components/visibility_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/reproduction_management_service.dart';
import 'package:igado_front/utils/alert_utils.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manejo Reprodutivo',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: kBrown2,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: kBackgroundTheme,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
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
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: kBrown1,
                                  ),
                                  Text(
                                    "Período da Inseminação",
                                    style: TextStyle(
                                      color: kBrown1,
                                    ),
                                  ),
                                ],
                              ),
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kBrown1,
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                underline: Container(
                                  height: 2,
                                  color: kBrown1,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                    formResponse["inseminationPeriod"] =
                                        newValue;
                                    print(newValue);
                                  });
                                },
                                isExpanded: true,
                                items: <String>[
                                  'Manhã',
                                  'Tarde',
                                  'Noite'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: new Align(
                                        alignment: Alignment.center,
                                        child: Text(value)),
                                  );
                                }).toList(),
                              ),
                            ],
                          )),
                      FlatButton(
                        onPressed: checkFormResponse(formResponse)
                            ? () {
                                setState(() {
                                  data = {
                                    "bovine_id": 1,
                                    "bull_breed": formResponse["bullBreed"],
                                    "reproduction_type": role ==
                                            ReproductionManagementRole
                                                .naturalMount
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
                          'Adicionar',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
