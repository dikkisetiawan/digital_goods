import 'dart:convert';

import '/models/user_model.dart';

import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://api-gowisata.aturtoko.site/api/user';

  Future<LoginModel> login(
      {required String email, required String password}) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'login': email,
      'password': password,
      'type': 'app',
      'acc_type': 'b2b'
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      LoginModel login = LoginModel.fromJson(data);
      login.accessToken = 'Bearer ' + data['access_token'];

      print(login);
      print(login.accessToken);

      return login;
    } else {
      throw Exception("Gagal Login");
    }
  }
}
