import 'dart:convert';
import 'package:tourism_app/constants/constants.dart';
import 'package:tourism_app/data/models/service_provider_models/account_verification_model.dart';
import 'package:http/http.dart' as http;

class AccVerifiProviderWeb {
  Future<AccVerifiProviderResponseModel> accVerifiUser(
      String email, String code) async {
    final url = Uri.parse('$baseUrl/verifyProvider');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          AccVerifiProviderRequestModel(email: email, code: code).toJson()),
    );
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final String message = responseBody['message'];
      return AccVerifiProviderResponseModel(message: message);
    } else {
      print(response.statusCode.toString());
      throw Exception('the code is not correct');
    }
  }
}
