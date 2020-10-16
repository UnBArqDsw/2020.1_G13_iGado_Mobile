import 'package:flutter/material.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
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
                    ),
                    IconTextFormField(
                      title: "Senha",
                      icon: Icons.lock_outline,
                      placeholder: "Digite sua senha",
                      obscureText: true,
                    ),
                    FlatButton(
                      onPressed: () {},
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
        ),
      ),
    );
  }
}
