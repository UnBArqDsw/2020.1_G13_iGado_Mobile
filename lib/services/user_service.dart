import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  Future<dynamic> createUser(Map data) async {
    var url = DotEnv().env['HOST_URL'] + 'user/create';
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else
      throw Exception('Failed to create user');
  }

  Future<User> fetchUser(int id) async {
    final response =
        await http.get(DotEnv().env['HOST_URL'] + 'user/${id.toString()}');
    print(response);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
  }
}

class User {
  final int userId;
  final String email;
  final String fullname;
  final String password;
  final bool isProprietary;
  final List<dynamic> farms;

  User(
      {this.userId,
      this.email,
      this.fullname,
      this.password,
      this.isProprietary,
      this.farms});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['data']['user_id'],
        email: json['data']['email'],
        fullname: json['data']['fullname'],
        password: json['data']['password'],
        isProprietary: json['data']['is_proprietary'],
        farms: json['data']['farms']);
  }
}
