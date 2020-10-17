import 'package:flutter/material.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/user_service.dart';

enum UserRole { owner, employee }
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
  var response;
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
                      ),
                      IconTextFormField(
                        title: "Data de Nascimento",
                        icon: Icons.calendar_today,
                        placeholder: "Digite sua data de nascimento",
                        obscureText: false,
                      ),
                      IconTextFormField(
                        title: "E-mail",
                        icon: Icons.mail_outline,
                        placeholder: "Digite seu e-mail",
                        obscureText: false,
                      ),
                      IconTextFormField(
                        title: "Confirme seu e-mail",
                        icon: Icons.mail_outline,
                        placeholder: "Confirme seu e-mail",
                        obscureText: false,
                      ),
                      IconTextFormField(
                        title: "Senha",
                        icon: Icons.lock_outline,
                        placeholder: "Digite sua senha",
                        obscureText: true,
                      ),
                      IconTextFormField(
                        title: "Confirme sua Senha",
                        icon: Icons.lock_outline,
                        placeholder: "Confirme sua senha",
                        obscureText: true,
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
                      Visibility(
                        child: IconTextFormField(
                          title: "Nome da sua fazenda",
                          icon: Icons.add_circle,
                          placeholder: "Nome da fazenda",
                          obscureText: false,
                        ),
                        visible: formOwner,
                      ),
                      Visibility(
                        child: IconTextFormField(
                          title: "Código identificador da fazenda",
                          icon: Icons.add_circle,
                          placeholder: "Código da fazenda",
                          obscureText: false,
                        ),
                        visible: formEmplooye,
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            data = {
                              "email": "johnson@johnson",
                              "fullname": "johnson",
                              "password": "147123",
                              "isproprietary": "true"
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
