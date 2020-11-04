import 'package:flutter/material.dart';
import 'package:igado_front/components/simple_card.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/bovine_service.dart';

class CattleScreen extends StatefulWidget {
  @override
  _CattleScreenState createState() => _CattleScreenState();
}

class _CattleScreenState extends State<CattleScreen> {
  List<dynamic> bovines = [];
  @override
  void initState() {
    super.initState();
    getBovinesData();
  }

  void getBovinesData() async {
    var response = await BovineService().getAllBovine();
    setState(() {
      bovines = response;
    });
    print(bovines);
  }

  @override
  Widget build(BuildContext context) {
    print(bovines);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: bovines.map((dynamic bovine) {
                return SimpleCard(
                  imageUrl:
                      'https://image.freepik.com/fotos-gratis/vacas-em-pe-no-campo-verde-na-frente-da-montanha-fuji-japao_335224-197.jpg',
                  title: bovine.name,
                  subtitle:
                      bovine.isBeefCattle ? "Gado de corte" : "Gado de Leite",
                );
              }).toList(),
            ),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/bovine');
                  },
                  child: Text(
                    'Adicionar Bovino',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            color: kBrown2,
          ),
        ],
      ),
    );
  }
}
