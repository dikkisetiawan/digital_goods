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

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      LoginModel login = LoginModel.fromJson(data);
      login.accessToken = 'Bearer ${data['access_token']}';

      return login;
    } else {
      throw Exception("Gagal Login");
    }
  }

  Future<UserModel> fetchUserProfile({required String token}) async {
    try {
      var url = "$baseUrl/user-profile";
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': token,
      };

      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];

        UserModel userData = UserModel.fromJson(data);

        return userData;
      } else {
        throw Exception("Gagal Fetch User Data");
      }
    } catch (e) {
      rethrow;
    }
  }
}
