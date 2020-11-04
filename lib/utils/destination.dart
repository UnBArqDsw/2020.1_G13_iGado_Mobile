import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Bovinos', Icons.pets),
  Destination('Relatórios', Icons.assignment),
  Destination('Início', Icons.home),
  Destination('Informações', Icons.info),
  Destination('Perfil', Icons.account_circle),
];
