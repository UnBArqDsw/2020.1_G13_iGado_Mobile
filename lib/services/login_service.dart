import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:igado_front/services/api.dart';

class LoginService {
  final API _api = API();
  Future<String> login(Map data) async {
    var url = _api.url + 'user/login';
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      return 'ok';
    } else {
      print(response.body);
      throw Exception('Invalid Credentials');
    }
  }
}

class LoginCredentials {
  final String email;
  final String password;

  LoginCredentials({this.email, this.password});

  factory LoginCredentials.fromJson(Map<String, dynamic> json) {
    return LoginCredentials(
        email: json['data']['email'], password: json['data']['password']);
  }
}
