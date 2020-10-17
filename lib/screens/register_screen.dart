import 'package:flutter/material.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/components/visibility_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/user_service.dart';

UserService userService = new UserService();

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  UserRole role = UserRole.employee;
  bool formOwner = false;
  bool formEmplooye = true;
  Map<String, dynamic> data;
  String fullName;
  String email;
  String emailConfirm;
  String password;
  String passwordConfirm;
  var date;
  var response;
  Map<String, dynamic> formResponse = {
    "fullName": "",
    "email": "",
    "emailConfirm": "",
    "date": "",
    "password": "",
    "passwordConfirm": "",
    "farmName": "",
    "farmCode": ""
  };

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
                'Cadastro',
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
                                formEmplooye = false;
                                formOwner = true;
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
                                formEmplooye = true;
                                formOwner = false;
                              });
                            },
                          ),
                        ),
                      ),
                      VisibilityFormField(
                        isVisible: formOwner,
                        title: "Nome da sua fazenda",
                        placeholder: "Nome da fazenda",
                        onChange: changeDictData('farmName'),
                      ),
                      VisibilityFormField(
                        isVisible: formEmplooye,
                        title: "Código identificador da fazenda",
                        placeholder: "Código da fazenda",
                        onChange: changeDictData('farmCode'),
                      ),
                      FlatButton(
                        onPressed: () {
                          print(formResponse);
                          setState(() {
                            data = {
                              "email": formResponse["email"],
                              "fullname": formResponse["fullName"],
                              "password": formResponse["password"],
                              "isproprietary":
                                  role == UserRole.employee ? true : false,
                            };
                            response = userService.createUser(data);
                          });
                        },
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: kBrown2,
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
        ),
      ),
    );
  }
}
