import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  String url = DotEnv().env['HOST_URL'];
  API._privateConstructor();
  static final API _instance = API._privateConstructor();

  factory API() {
    return _instance;
  }
}
