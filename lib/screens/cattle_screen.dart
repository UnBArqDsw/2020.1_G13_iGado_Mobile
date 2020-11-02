import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/bovine_service.dart';

class CattleScreen extends StatefulWidget {
  @override
  _CattleScreenState createState() => _CattleScreenState();
}

class _CattleScreenState extends State<CattleScreen> {
  var bovineList;
  @override
  void initState() {
    super.initState();
    getBovinesData();
  }

  void getBovinesData() async {
    bovineList = await BovineService().getAllBovine();
    print(bovineList);
  }

  @override
  Widget build(BuildContext context) {
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
              children: kScrollMock,
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
                Text(
                  'Adicionar Bovino',
                  style: TextStyle(
                    color: Colors.white,
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
