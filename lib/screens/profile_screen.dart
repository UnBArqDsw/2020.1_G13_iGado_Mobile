import 'package:flutter/material.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/user_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = UserService().fetchUser(1);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User userInfo = snapshot.data;
          print(userInfo);
          return SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Perfil',
                  style: TextStyle(
                      color: kBrown2,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 35, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/profile.png'),
                        height: 150.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        userInfo.fullname,
                        style: TextStyle(
                          color: kBrown1,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                          userInfo.isProprietary
                              ? 'Proprietário da fazenda ${userInfo.farms[0].toString()}'
                              : 'Funcionário da fazenda ${userInfo.farms[0].toString()}',
                          style: TextStyle(color: kBrown1, fontSize: 20.0)),
                      Text(userInfo.email,
                          style: TextStyle(color: kBrown1, fontSize: 15.0)),
                      SizedBox(
                        height: 115.0,
                      ),
                      Center(
                        child: FlatButton(
                          onPressed: () {
                            print(userInfo.isProprietary);
                          },
                          child: Text(
                            'Sair da Conta',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: kBrown2,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
