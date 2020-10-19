import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  Future<dynamic> createUser(Map data) async {
    var url = 'http://10.0.2.2:5001/user/create';
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
      throw Exception('Failed to create user. Error $statusCode');
  }
}
