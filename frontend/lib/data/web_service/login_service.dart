import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/data/model/loginModel.dart';

class LoginWebService {
  Future<UserLogin> login(String email, String password) async {
    final url = Uri.parse('http://192.168.1.105:8000/api/login_user');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(LoginModel(email: email, password: password).toJson()),
    );

    if (response.statusCode == 200) {
      final info = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', info['token']);
      await prefs.setString('message', info['message']);
      await prefs.setInt('status', info['status']);

      return UserLogin.fromJson(info);
    } else {
      print(response.statusCode.toString());
      throw Exception('Failed to login');
    }
  }
}
