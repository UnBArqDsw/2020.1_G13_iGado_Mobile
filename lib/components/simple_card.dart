import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/bovine_service.dart';

class SimpleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  SimpleCard({this.title, this.subtitle, this.imageUrl});
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
