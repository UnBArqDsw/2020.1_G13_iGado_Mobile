import 'package:flutter/material.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/components/visibility_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/bovine_service.dart';
import 'package:igado_front/utils/alert_utils.dart';

BovineService bovineService = new BovineService();

class BovineScreen extends StatefulWidget {
  @override
  _BovineScreenState createState() => _BovineScreenState();
}

class _BovineScreenState extends State<BovineScreen> {
  BovineRole role = BovineRole.beefCattle;
  bool isBeefCattle = true;
  bool isDairyCattle = false;
  Map<String, dynamic> data;
  var response;

  Map<String, dynamic> formResponse = {
    "name": "",
    "breed": "",
    "dateActualWeight": "",
    "lastWeight": "",
    "actualWeight": "",
    "dateLastWeight": "",
    "dateOfBirth": "",
    "geneticalEnhancement": "",
    "isPregnant": false,
  };

  bool checkFormResponse(formResponse) {
    if (formResponse["name"].isEmpty ||
        formResponse["breed"].isEmpty ||
        formResponse["dateActualWeight"].isEmpty ||
        formResponse["lastWeight"].isEmpty ||
        formResponse["actualWeight"].isEmpty ||
        formResponse["dateLastWeight"].isEmpty ||
        formResponse["dateOfBirth"].isEmpty ||
        (formResponse["geneticalEnhancement"].isEmpty &&
            formResponse["isPregnant"] == false)) {
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Text(
                'Adicionar Bovino',
                style: TextStyle(
                    color: kBrown2,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconTextFormField(
                        title: "Nome",
                        icon: Icons.agriculture_outlined,
                        placeholder: "Digite o nome do bovino",
                        obscureText: false,
                        onChange: changeDictData('name'),
                      ),
                      IconTextFormField(
                        title: "Raça",
                        icon: Icons.info,
                        placeholder: "Digite a raça do bovino",
                        obscureText: false,
                        onChange: changeDictData('breed'),
                      ),
                      IconTextFormField(
                        title: "Data de nascimento",
                        icon: Icons.calendar_today,
                        placeholder: "Digite a data de nascimento",
                        obscureText: false,
                        onChange: changeDictData('dateOfBirth'),
                      ),
                      IconTextFormField(
                        title: "Peso atual",
                        icon: Icons.line_weight,
                        placeholder: "Digite o peso atual do bovino",
                        obscureText: false,
                        onChange: changeDictData('actualWeight'),
                      ),
                      IconTextFormField(
                        title: "Data da pesagem atual",
                        icon: Icons.calendar_today,
                        placeholder: "Digite a data da pesagem atual",
                        obscureText: false,
                        onChange: changeDictData('dateActualWeight'),
                      ),
                      IconTextFormField(
                        title: "Peso antigo",
                        icon: Icons.line_weight,
                        placeholder: "Digite a data da pesagem antiga",
                        obscureText: false,
                        onChange: changeDictData('lastWeight'),
                      ),
                      IconTextFormField(
                        title: "Data da pesagem antiga",
                        icon: Icons.calendar_today,
                        placeholder: "Digite a data da pesagem antiga",
                        obscureText: false,
                        onChange: changeDictData('dateLastWeight'),
                      ),
                      Text(
                        "Tipo de gado",
                        style: TextStyle(
                          color: kBrown1,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.85,
                        alignment: Alignment.topLeft,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text('Gado de corte'),
                          leading: Radio(
                            activeColor: kBrown1,
                            value: BovineRole.beefCattle,
                            groupValue: role,
                            onChanged: (BovineRole value) {
                              setState(() {
                                role = value;
                                isBeefCattle = true;
                                isDairyCattle = false;
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
                          title: Text('Gado de leite'),
                          leading: Radio(
                            activeColor: kBrown1,
                            value: BovineRole.dairyCattle,
                            groupValue: role,
                            onChanged: (BovineRole value) {
                              setState(() {
                                role = value;
                                isBeefCattle = false;
                                isDairyCattle = true;
                              });
                            },
                          ),
                        ),
                      ),
                      Visibility(
                        child: Column(
                          children: [
                            Text(
                              "Prenha",
                              style: TextStyle(
                                color: kBrown1,
                              ),
                            ),
                            Switch(
                              onChanged: (value) {
                                setState(() {
                                  formResponse["isPregnant"] = value;
                                });
                              },
                              value: formResponse["isPregnant"],
                            ),
                          ],
                        ),
                        visible: isDairyCattle,
                      ),
                      VisibilityFormField(
                        isVisible: isBeefCattle,
                        title: "Melhoramento genético",
                        onChange: changeDictData('geneticalEnhancement'),
                        placeholder: "Melhoramento genético",
                      ),
                      FlatButton(
                        onPressed: checkFormResponse(formResponse)
                            ? () {
                                setState(() {
                                  data = {
                                    "farm_id": 1,
                                    "name": formResponse["name"],
                                    "breed": formResponse["breed"],
                                    "date_actual_weight":
                                        formResponse["dateActualWeight"],
                                    "last_weight": formResponse["lastWeight"],
                                    "actual_weight":
                                        formResponse["actualWeight"],
                                    "date_last_weight":
                                        formResponse["dateLastWeight"],
                                    "date_of_birth":
                                        formResponse["dateOfBirth"],
                                    "is_beef_cattle":
                                        role == BovineRole.beefCattle
                                            ? true
                                            : false,
                                    "genetical_enhancement": isBeefCattle
                                        ? formResponse["geneticalEnhancement"]
                                        : false,
                                    "is_pregnant": isDairyCattle
                                        ? formResponse["isPregnant"]
                                        : false,
                                  };
                                  response = bovineService
                                      .createBovine(data)
                                      .then((value) => showAlert(
                                            "Bovino cadastrado com sucesso!",
                                            context,
                                          ))
                                      .catchError((e) {
                                    print(e);
                                    showAlert(
                                      "Opa, não foi possível criar bovino, verifique os dados ou tente novamente mais tarde.",
                                      context,
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
                  Navigator.pushNamed(context, '/login');
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
