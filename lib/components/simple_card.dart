import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/bovine_service.dart';

class SimpleCard extends StatelessWidget {
  final Bovine bovine;
  SimpleCard({this.bovine});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        child: Column(
          children: [
            Image.network(
              'https://blog.belgobekaert.com.br/agro/wp-content/uploads/sites/2/2020/05/cria%C3%A7%C3%A3o-de-gado-nelore.jpg',
              width: 170.0,
            ),
            ListTile(
              title: Text(bovine.name),
              subtitle:
                  Text(bovine.isBeefCattle ? "Gado de corte" : "Gado de Leite"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  minWidth: 60.0,
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  child: Text(
                    "Ver",
                    style: TextStyle(
                      color: kBrown2,
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 30.0,
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  child: Icon(
                    Icons.more_vert,
                    size: 12.0,
                    color: kBrown2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
