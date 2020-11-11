import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:igado_front/services/api.dart';

class ReproductionManagementService {
  final API _api = API();
  Future<dynamic> performReproductionManagement(Map data) async {
    var url = _api.url + 'reproduction_management';
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
      throw Exception(
          'Failed to perform reproduction management. Error $statusCode');
  }
}

//   Future<Bovine> fetchBovine(int id) async {
//     final response = await http.get(_api.url + 'bovine/${id.toString()}');
//     print(response);
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       return Bovine.fromJson(jsonDecode(response.body));
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load bovine');
//     }
//   }

//   Future<List<Bovine>> getAllBovine() async {
//     final response = await http.get(_api.url + 'bovine');
//     List<Bovine> bovines = [];
//     if (response.statusCode == 200) {
//       var decodedBody = jsonDecode(response.body);
//       print(decodedBody['beef_cattles'].length);
//       for (var bovine in decodedBody['beef_cattles']) {
//         bovines.add(Bovine.fromJson({"data": bovine}));
//       }
//       for (var bovine in decodedBody['dairy_cattles']) {
//         bovines.add(Bovine.fromJson({"data": bovine}));
//       }
//       return bovines;
//     } else {
//       throw Exception('Failed to load bovines');
//     }
//   }
// }

class ReproductionManagement {
  final int bovineId;
  final int reproductionManagementId;
  final DateTime dateAndHourOfManagement;
  final String bullBreed;
  final int bullId;
  final String reproductionType;
  final int inseminationAmount;
  final List<String> inseminationPeriod;
  final bool isFinished;

  ReproductionManagement(
      {this.bovineId,
      this.reproductionManagementId,
      this.dateAndHourOfManagement,
      this.bullBreed,
      this.bullId,
      this.reproductionType,
      this.inseminationAmount,
      this.inseminationPeriod,
      this.isFinished});
}

//   factory ReproductionManagement.fromJson(Map<String, dynamic> json) {
//     return ReproductionManagement(
//         bovineId: json['data']['bovine_id'],
//         name: json['data']['name'],
//         breed: json['data']['breed'],
//         actualWeight: json['data']['actual_weight'],
//         dateOfBirth: json['data']['date_of_birth'],
//         isBeefCattle: json['data']['is_beef_cattle'],
//         geneticalEnhancement: json['data']['genetical_enhancement'],
//         isPregnant: json['data']['is_pregnant'],
//         farmId: json['data']['farm_id']);
//   }
// }
