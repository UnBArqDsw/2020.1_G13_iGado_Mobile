import 'package:flutter/material.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/components/visibility_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/bovine_service.dart';
import 'package:igado_front/utils/alert_utils.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

BovineService bovineService = new BovineService();

class BovineScreen extends StatefulWidget {
  bool isEditCattle;
  BovineScreen({@required this.isEditCattle});
  @override
  _BovineScreenState createState() => _BovineScreenState();
}

class _BovineScreenState extends State<BovineScreen> {
  BovineRole role = BovineRole.beefCattle;
  bool isBeefCattle = true;
  bool isDairyCattle = false;
  Map<String, dynamic> data;
  var response;
  final Map<String, String> _formData = {};

  Map<String, dynamic> formResponse = {
    "name": "",
    "breed": "",
    "actualWeight": "",
    "dateOfBirth": "",
    "geneticalEnhancement": "",
    "isPregnant": false,
  };

  bool checkFormResponse(formResponse) {
    if (formResponse["name"].isEmpty ||
        formResponse["breed"].isEmpty ||
        formResponse["actualWeight"].isEmpty ||
        (formResponse["geneticalEnhancement"].isEmpty && isBeefCattle)) {
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

  void _loadFormData(Bovine bovineInfo) {
    if (bovineInfo != null) {
      _formData['bovineId'] = bovineInfo.bovineId.toString();
      _formData['name'] = bovineInfo.name;
      _formData['breed'] = bovineInfo.breed;
      _formData['actualWeight'] = bovineInfo.actualWeight.toString();
      _formData['dateOfBirth'] = bovineInfo.dateOfBirth;
      _formData['geneticalEnhancement'] = bovineInfo.geneticalEnhancement;
      _formData['isPregnant'] = bovineInfo.isPregnant.toString();
    }
  }

  Widget build(BuildContext context) {
    final Bovine bovineInfo = ModalRoute.of(context).settings.arguments;

    _loadFormData(bovineInfo);

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
                bovineInfo == null ? 'Adicionar Bovino' : 'Editar Bovino',
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
                        initialValue: _formData['name'],
                        title: "Nome",
                        icon: MaterialCommunityIcons.cow,
                        placeholder: "Digite o nome do bovino",
                        obscureText: false,
                        onChange: changeDictData('name'),
                      ),
                      IconTextFormField(
                        initialValue: _formData['breed'],
                        title: "Raça",
                        icon: Icons.pets,
                        placeholder: "Digite a raça do bovino",
                        obscureText: false,
                        onChange: changeDictData('breed'),
                      ),
                      IconTextFormField(
                        initialValue: _formData['dateOfBirth'],
                        title: "Data de nascimento",
                        icon: FontAwesome.calendar,
                        placeholder: "Digite a data de nascimento",
                        obscureText: false,
                        onChange: changeDictData('dateOfBirth'),
                      ),
                      IconTextFormField(
                        initialValue: _formData['actualWeight'],
                        title: "Peso atual",
                        icon: MaterialCommunityIcons.weight,
                        placeholder: "Digite o peso atual do bovino",
                        obscureText: false,
                        onChange: changeDictData('actualWeight'),
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
                                  print(formResponse["isPregnant"].runtimeType);
                                  formResponse["isPregnant"] = !!value;
                                });
                              },
                              value: formResponse["isPregnant"],
                            ),
                          ],
                        ),
                        visible: isDairyCattle,
                      ),
                      VisibilityFormField(
                        initialValue: _formData['geneticalEnhancement'],
                        isVisible: isBeefCattle,
                        title: "Melhoramento genético",
                        onChange: changeDictData('geneticalEnhancement'),
                        placeholder: "Melhoramento genético",
                      ),
                      Visibility(
                        child: FlatButton(
                          onPressed: checkFormResponse(formResponse)
                              ? () {
                                  setState(() {
                                    data = {
                                      "farm_id": 1,
                                      "batch_of_beef": 1,
                                      "name": formResponse["name"],
                                      "breed": formResponse["breed"],
                                      "actual_weight":
                                          formResponse["actualWeight"],
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
                                        .then((value) {
                                      showAlert(
                                        "Bovino cadastrado com sucesso!",
                                        context,
                                        () {
                                          Navigator.pushNamed(context, '/');
                                        },
                                      );
                                    }).catchError((e) {
                                      print(e);
                                      showAlert(
                                        "Opa, não foi possível criar bovino, verifique os dados ou tente novamente mais tarde.",
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
                        visible: !widget.isEditCattle,
                      ),
                      Visibility(
                        child: FlatButton(
                          minWidth: 100,
                          onPressed: () {
                            setState(() {
                              data = {
                                "farm_id": 1,
                                "batch_of_beef": 1,
                                "name": formResponse["name"].length > 0
                                    ? formResponse["name"]
                                    : _formData['name'],
                                "breed": formResponse["breed"].length > 0
                                    ? formResponse["breed"]
                                    : _formData['breed'],
                                "actual_weight":
                                    formResponse["actualWeight"].length > 0
                                        ? formResponse["actualWeight"]
                                        : _formData['actualWeight'],
                                "date_of_birth":
                                    formResponse["dateOfBirth"].length > 0
                                        ? formResponse["dateOfBirth"]
                                        : _formData['dateOfBirth'],
                                "is_beef_cattle": role == BovineRole.beefCattle
                                    ? true
                                    : false,
                                "genetical_enhancement": isBeefCattle
                                    ? (formResponse["geneticalEnhancement"]
                                                .length >
                                            0
                                        ? formResponse["geneticalEnhancement"]
                                        : _formData["geneticalEnhancement"])
                                    : false,
                                "is_pregnant": isDairyCattle
                                    ? formResponse["isPregnant"]
                                    : false,
                              };
                              response = bovineService
                                  .updateBovine(data, bovineInfo.bovineId)
                                  .then((value) {
                                showAlert(
                                  "Bovino editado com sucesso!",
                                  context,
                                  () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                );
                              }).catchError((e) {
                                print(e);
                                showAlert(
                                  "Opa, não foi possível editar o bovino, verifique os dados ou tente novamente mais tarde.",
                                  context,
                                  null,
                                );
                              });
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Editar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(Icons.edit),
                            ],
                          ),
                          color: kBrown2,
                          disabledColor: kDisabledButtonColor,
                        ),
                        visible: widget.isEditCattle,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                child: FlatButton(
                  minWidth: 100,
                  onPressed: () {
                    response = bovineService
                        .deleteBovine(bovineInfo.bovineId)
                        .then((value) {
                      showAlert(
                        "Bovino excluido com sucesso!",
                        context,
                        () {
                          Navigator.pushNamed(context, '/');
                        },
                      );
                    }).catchError((e) {
                      print(e);
                      showAlert(
                        "Opa, não foi possível excluir o bovino, verifique os dados ou tente novamente mais tarde.",
                        context,
                        null,
                      );
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Excluir',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.delete),
                    ],
                  ),
                  color: Colors.red,
                  disabledColor: kDisabledButtonColor,
                ),
                visible: widget.isEditCattle,
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
