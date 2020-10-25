import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  Future<String> login(Map data) async {
    var url = DotEnv().env['HOST_URL'] + 'user/login';
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      return 'ok';
    } else
      throw Exception('Invalid Credentials');
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
