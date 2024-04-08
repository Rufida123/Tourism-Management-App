import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/constants/constants.dart';
import 'package:tourism_app/data/models/service_provider_models/login_model.dart';
import 'package:tourism_app/data/models/user_models/loginModel.dart';

class LoginUserWeb {
  Future<LoginUserRespnseModel> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/login_user');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          LoginProviderRequestModel(email: email, password: password).toJson()),
    );

    if (response.statusCode == 200) {
      final info = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', info['token']);
      await prefs.setString('message', info['message']);
      await prefs.setInt('status', info['status']);

      return LoginUserRespnseModel.fromJson(info);
    } else {
      print(response.statusCode.toString());
      throw Exception('Failed to login');
    }
  }
}
