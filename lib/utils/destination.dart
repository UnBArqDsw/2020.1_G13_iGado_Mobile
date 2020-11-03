import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Bovino', Icons.pets),
  Destination('Relatório', Icons.assignment),
  Destination('Início', Icons.home),
  Destination('Informações', Icons.info),
  Destination('Perfil', Icons.account_circle),
];
