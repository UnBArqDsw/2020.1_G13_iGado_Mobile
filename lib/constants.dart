import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum UserRole { owner, employee }
enum BovineRole { beefCattle, dairyCattle }
enum ReproductionManagementRole { naturalMount, insemination }
// Colors
Color kBrown1 = Color(0xFFC97946);
Color kBrown2 = Color(0xFFAD7B56);
Color kBege1 = Color(0xFFEFC19D);
Color kDisabledButtonColor = Color(0xFFC8C8C8);
//Styles
Decoration kBackgroundTheme = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      kBege1,
    ],
  ),
);

InputDecoration kInputFormStyle = InputDecoration(
  hintStyle: TextStyle(
    color: Color(0xFFAAAAAA),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide.none,
  ),
  fillColor: Color(0xFFEBEBEB),
  filled: true,
);

// Texts and icons
// List<IconData> icons = [
//   Icons.person_outline,
//   Icons.calendar_today,
//   Icons.mail_outline,
//   Icons.mail_outline,
//   Icons.lock_outline,
//   Icons.lock_outline,
// ];

List<Widget> kScrollMock = <Widget>[
  Container(
    width: 170.0,
    child: Card(
      child: Column(
        children: [
          Image.network(
            'https://blog.belgobekaert.com.br/agro/wp-content/uploads/sites/2/2020/05/cria%C3%A7%C3%A3o-de-gado-nelore.jpg',
            width: 170.0,
          ),
          ListTile(
            title: Text("Gado 1"),
            subtitle: Text("Gado de Corte"),
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
  ),
  Container(
    width: 170.0,
    child: Card(
      child: Column(
        children: [
          Image.network(
            'https://blog.belgobekaert.com.br/agro/wp-content/uploads/sites/2/2020/05/cria%C3%A7%C3%A3o-de-gado-nelore.jpg',
            width: 170.0,
          ),
          ListTile(
            title: Text("Gado 1"),
            subtitle: Text("Gado de Corte"),
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
  ),
  Container(
    width: 170.0,
    child: Card(
      child: Column(
        children: [
          Image.network(
            'https://blog.belgobekaert.com.br/agro/wp-content/uploads/sites/2/2020/05/cria%C3%A7%C3%A3o-de-gado-nelore.jpg',
            width: 170.0,
          ),
          ListTile(
            title: Text("Gado 1"),
            subtitle: Text("Gado de Corte"),
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
  ),
  Container(
    width: 170.0,
    child: Card(
      child: Column(
        children: [
          Image.network(
            'https://blog.belgobekaert.com.br/agro/wp-content/uploads/sites/2/2020/05/cria%C3%A7%C3%A3o-de-gado-nelore.jpg',
            width: 170.0,
          ),
          ListTile(
            title: Text("Gado 1"),
            subtitle: Text("Gado de Corte"),
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
  ),
  Container(
    width: 170.0,
    child: Card(
      child: Column(
        children: [
          Image.network(
            'https://blog.belgobekaert.com.br/agro/wp-content/uploads/sites/2/2020/05/cria%C3%A7%C3%A3o-de-gado-nelore.jpg',
            width: 170.0,
          ),
          ListTile(
            title: Text("Gado 1"),
            subtitle: Text("Gado de Corte"),
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
  ),
];
// images

String kLogo = 'assets/images/logo.png';
