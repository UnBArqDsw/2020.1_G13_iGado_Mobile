import 'package:flutter/material.dart';
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
        backgroundColor: brown2,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: backgroundTheme,
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
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          color: brown1,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            "E-mail",
                            style: TextStyle(
                              color: brown1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: inputFormStyle.copyWith(
                        hintText: "Digite seu email",
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.lock_outline,
                          color: brown1,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            "Senha",
                            style: TextStyle(
                              color: brown1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: inputFormStyle.copyWith(
                        hintText: "Digite sua senha",
                      ),
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
                      color: brown2,
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Ou cadastre-se aqui',
                  style: TextStyle(
                    color: brown1,
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
