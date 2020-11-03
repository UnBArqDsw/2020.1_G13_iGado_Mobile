import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/bovine_service.dart';

class DataBovineScreen extends StatefulWidget {
  @override
  _DataBovineScreenState createState() => _DataBovineScreenState();
}

class _DataBovineScreenState extends State<DataBovineScreen> {
  Future<Bovine> futureBovine;

  @override
  void initState() {
    super.initState();
    futureBovine = BovineService().fetchBovine(2);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Bovine>(
      future: futureBovine,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Bovine bovineInfo = snapshot.data;
          print(bovineInfo);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kBrown2,
              automaticallyImplyLeading: false,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: kBackgroundTheme,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gado ${bovineInfo.bovineId.toString()}',
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
                            image: AssetImage('assets/images/cow.jpg'),
                            height: 150.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            bovineInfo.name,
                            style: TextStyle(
                              color: kBrown1,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            bovineInfo.isBeefCattle
                                ? 'Tipo: Gado de Corte'
                                : 'Tipo: Gado de Leite',
                            style: TextStyle(color: kBrown1, fontSize: 15.0),
                          ),
                          Text(
                            'Raça: ' + bovineInfo.breed,
                            style: TextStyle(color: kBrown1, fontSize: 15.0),
                          ),
                          Text(
                            'Peso: ' +
                                bovineInfo.actualWeight.toString() +
                                ' Kg',
                            style: TextStyle(color: kBrown1, fontSize: 15.0),
                          ),
                          Text(
                            'Nascimento: ' + bovineInfo.dateOfBirth,
                            style: TextStyle(color: kBrown1, fontSize: 15.0),
                          ),
                          SizedBox(
                            height: 115.0,
                          ),
                          Center(
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Realizar Manejo',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: kBrown2,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
