import 'dart:convert';

import 'package:tourism_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_app/data/models/service_provider_models/password_virification_model.dart';

class ProviderPassVerifiWeb {
  Future<void> providerPassVerifi(String code, String email) async {
    final url = Uri.parse('$baseUrl/user/password/code/check');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          PassVerifiProviderModel(code: code, email: email).toJson()),
    );
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(responseBody);
    } else {
      print(response.statusCode.toString());
      throw Exception('the code is not correct');
    }
  }
}
