import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/constants/constants.dart';
import 'package:tourism_app/data/models/user_models/loginModel.dart';

class LoginUserWeb {
  Future<LoginUserRespnseModel> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/login_user');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          LoginUserRequestModel(email: email, password: password).toJson()),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      final String token = responseBody['data'];
      final String message = responseBody['message'];
      final int status = responseBody['status'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return LoginUserRespnseModel(
          message: message, token: token, status: status);
    } else {
      print(response.statusCode.toString());
      throw Exception('Failed to login');
    }
  }
}
