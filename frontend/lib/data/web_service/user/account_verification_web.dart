import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/constants/constants.dart';
import 'package:tourism_app/data/models/user_models/account_verification_model.dart';
import 'package:http/http.dart' as http;

class AccVerifiUserWeb {
  Future<AccVerifiUserResponseModel> accVerifiUser(
      String email, String code) async {
    final url = Uri.parse('$baseUrl/verifyUser');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          AccVerifiUserRequestModel(email: email, code: code).toJson()),
    );
    if (response.statusCode == 200) {
      final info = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('message', info['message']);
      return AccVerifiUserResponseModel.fromJson(info);
    } else {
      print(response.statusCode.toString());
      throw Exception('the code is not correct');
    }
  }
}
