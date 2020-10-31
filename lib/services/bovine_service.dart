import 'dart:ffi';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:igado_front/services/api.dart';

class BovineService {
  final API _api = API();
  Future<dynamic> createBovine(Map data) async {
    var url = _api.url + 'bovine';
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    int statusCode = response.statusCode;
    if (statusCode == 201) {
      return jsonDecode(response.body);
    } else
      throw Exception('Failed to create bovine. Error $statusCode');
  }

  Future<Bovine> fetchBovine(int id) async {
    final response = await http.get(_api.url + 'bovine/${id.toString()}');
    print(response);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Bovine.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load bovine');
    }
  }
}

class Bovine {
  final int bovineId;
  final String name;
  final String breed;
  final Double actualWeight;
  final DateTime dateActualWeight;
  final Double lastWeight;
  final DateTime dateLastWeight;
  final DateTime dateOfBirth;
  final bool isBeefCattle;
  final String geneticalEnhancement;
  final bool isPregnant;
  final int farmId;

  Bovine(
      {this.bovineId,
      this.name,
      this.breed,
      this.dateActualWeight,
      this.lastWeight,
      this.actualWeight,
      this.dateLastWeight,
      this.dateOfBirth,
      this.isBeefCattle,
      this.geneticalEnhancement,
      this.isPregnant,
      this.farmId});

  factory Bovine.fromJson(Map<String, dynamic> json) {
    return Bovine(
        bovineId: json['data']['bovineId'],
        name: json['data']['name'],
        breed: json['data']['breed'],
        dateActualWeight: json['data']['dateActualWeight'],
        lastWeight: json['data']['lastWeight'],
        actualWeight: json['data']['actualWeight'],
        dateLastWeight: json['data']['dateLastWeight'],
        dateOfBirth: json['data']['dateOfBirth'],
        isBeefCattle: json['data']['isBeefCattle'],
        geneticalEnhancement: json['data']['geneticalEnhancement'],
        isPregnant: json['data']['isPregnant'],
        farmId: json['data']['farmId']);
  }
}
