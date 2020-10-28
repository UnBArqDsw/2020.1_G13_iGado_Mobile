import 'package:flutter/material.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/login_service.dart';

LoginService loginService = new LoginService();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

Map<String, String> data;
var response;
Map<String, dynamic> formResponse = {
  "email": "",
  "password": "",
};

class _LoginPageState extends State<LoginPage> {
  Function changeDictData(String field) {
    return (text) {
      setState(() {
        formResponse[field] = text;
      });
    };
  }

  bool checkIfFormResponse(formResponse) {
    if (formResponse["email"].isEmpty || formResponse["password"].isEmpty)
      return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/logo.png'),
            height: 200.0,
          ),
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconTextFormField(
                  title: "E-mail",
                  icon: Icons.mail_outline,
                  placeholder: "Digite seu e-mail",
                  obscureText: false,
                  onChange: changeDictData('email'),
                ),
                IconTextFormField(
                  title: "Senha",
                  icon: Icons.lock_outline,
                  placeholder: "Digite sua senha",
                  obscureText: true,
                  onChange: changeDictData('password'),
                ),
                FlatButton(
                  onPressed: checkIfFormResponse(formResponse)
                      ? () {
                          setState(() {
                            data = {
                              "email": formResponse['email'],
                              "password": formResponse['password'],
                            };
                            response = loginService.login(data);
                            response
                                .then((value) =>
                                    {Navigator.pushNamed(context, '/profile')})
                                .catchError(() => {print('deu ruim')});
                            print('kk');
                          });
                        }
                      : null,
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: kBrown2,
                ),
              ],
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              'Ou cadastre-se aqui',
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
