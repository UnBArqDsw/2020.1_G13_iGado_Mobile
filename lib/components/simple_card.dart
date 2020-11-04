import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/screens/data_bovine_screen.dart';

class SimpleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final int id;
  SimpleCard({this.title, this.subtitle, this.imageUrl, this.id});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        child: Column(
          children: [
            Image.network(
              imageUrl,
              width: 170.0,
            ),
            ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  minWidth: 60.0,
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataBovineScreen(
                            bovineId: id,
                          ),
                        ));
                  },
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
