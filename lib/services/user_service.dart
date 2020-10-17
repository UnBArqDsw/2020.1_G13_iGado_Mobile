import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  Future<dynamic> createUser(Map data) async {
    var url = 'http://10.0.2.2:5001/user/create';
    print(data);
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return response;
  }
}
