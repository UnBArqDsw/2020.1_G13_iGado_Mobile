import 'package:flutter/material.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/components/visibility_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/user_service.dart';
import 'package:igado_front/utils/alert_utils.dart';

UserService userService = new UserService();

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  UserRole role = UserRole.employee;
  bool isOwner = false;
  bool isEmplooye = true;
  Map<String, dynamic> data;
  var response;

  Map<String, dynamic> formResponse = {
    "fullName": "",
    "email": "",
    "emailConfirm": "",
    "date": "",
    "password": "",
    "passwordConfirm": "",
    "farmName": "",
    "farmCode": "",
    "farmSize": "",
  };

  bool checkFormResponse(formResponse) {
    if (formResponse["fullName"].isEmpty ||
        formResponse["email"].isEmpty ||
        formResponse["emailConfirm"].isEmpty ||
        formResponse["date"].isEmpty ||
        formResponse["password"].isEmpty ||
        formResponse["passwordConfirm"].isEmpty ||
        (formResponse["farmName"].isEmpty &&
            formResponse["farmCode"].isEmpty)) {
      return false;
    }
    if (!checkFieldsAreEquals("password")) return false;
    if (!checkFieldsAreEquals("email")) return false;
    return true;
  }

  bool checkFieldsAreEquals(String field) {
    if (formResponse[field] == formResponse["$field" "Confirm"]) return true;
    return false;
  }

  Function changeDictData(String field) {
    return (text) {
      setState(() {
        formResponse[field] = text;
      });
    };
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cadastro',
            style: TextStyle(
                color: kBrown2, fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconTextFormField(
                    title: "Nome Completo",
                    icon: Icons.person_outline,
                    placeholder: "Digite seu nome",
                    obscureText: false,
                    onChange: changeDictData('fullName'),
                  ),
                  IconTextFormField(
                    title: "Data de Nascimento",
                    icon: Icons.calendar_today,
                    placeholder: "Digite sua data de nascimento",
                    obscureText: false,
                    onChange: changeDictData('date'),
                  ),
                  IconTextFormField(
                    title: "E-mail",
                    icon: Icons.mail_outline,
                    placeholder: "Digite seu e-mail",
                    obscureText: false,
                    onChange: changeDictData('email'),
                  ),
                  IconTextFormField(
                    title: "Confirme seu e-mail",
                    icon: Icons.mail_outline,
                    placeholder: "Confirme seu e-mail",
                    obscureText: false,
                    onChange: changeDictData('emailConfirm'),
                  ),
                  IconTextFormField(
                    title: "Senha",
                    icon: Icons.lock_outline,
                    placeholder: "Digite sua senha",
                    obscureText: true,
                    onChange: changeDictData('password'),
                  ),
                  IconTextFormField(
                    title: "Confirme sua Senha",
                    icon: Icons.lock_outline,
                    placeholder: "Confirme sua senha",
                    obscureText: true,
                    onChange: changeDictData('passwordConfirm'),
                  ),
                  Text(
                    "Função na fazenda",
                    style: TextStyle(
                      color: kBrown1,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.85,
                    alignment: Alignment.topLeft,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('Proprietário'),
                      leading: Radio(
                        activeColor: kBrown1,
                        value: UserRole.owner,
                        groupValue: role,
                        onChanged: (UserRole value) {
                          setState(() {
                            role = value;
                            isEmplooye = false;
                            isOwner = true;
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
                      title: Text('Funcionário'),
                      leading: Radio(
                        activeColor: kBrown1,
                        value: UserRole.employee,
                        groupValue: role,
                        onChanged: (UserRole value) {
                          setState(() {
                            role = value;
                            isEmplooye = true;
                            isOwner = false;
                          });
                        },
                      ),
                    ),
                  ),
                  VisibilityFormField(
                    isVisible: isOwner,
                    title: "Nome da sua fazenda",
                    placeholder: "Nome da fazenda",
                    onChange: changeDictData('farmName'),
                  ),
                  VisibilityFormField(
                    isVisible: isOwner,
                    title: "Tamanho da sua fazenda",
                    placeholder: "Tamanho da fazenda",
                    onChange: changeDictData('farmSize'),
                  ),
                  VisibilityFormField(
                    isVisible: isEmplooye,
                    title: "Código identificador da fazenda",
                    placeholder: "Código da fazenda",
                    onChange: changeDictData('farmCode'),
                  ),
                  FlatButton(
                    onPressed: checkFormResponse(formResponse)
                        ? () {
                            setState(() {
                              data = {
                                "email": formResponse["email"],
                                "fullname": formResponse["fullName"],
                                "password": formResponse["password"],
                                "is_proprietary":
                                    role == UserRole.employee ? true : false,
                                "farm_id": isEmplooye
                                    ? formResponse["farmCode"]
                                    : false,
                                "farm_name":
                                    isOwner ? formResponse["farmName"] : false,
                                "farm_size":
                                    isOwner ? formResponse["farmSize"] : false,
                              };
                              response = userService
                                  .createUser(data)
                                  .then((value) => showAlert(
                                        "Usuário cadastrado com sucesso.",
                                        context,
                                      ))
                                  .catchError((e) {
                                print(e);
                                showAlert(
                                  "Opa, não foi possível criar seu usuário, verifique seus dados ou tente novamente mais tarde.",
                                  context,
                                );
                              });
                            });
                          }
                        : null,
                    child: Text(
                      'Cadastrar',
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
              'Ou entre aqui',
              style: TextStyle(
                color: kBrown1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
