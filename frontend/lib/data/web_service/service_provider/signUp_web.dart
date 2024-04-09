import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tourism_app/constants/constants.dart';
import 'package:tourism_app/data/models/service_provider_models/sign_up_model.dart';

class SignUpProviderWeb {
  Future<SignUpProviderResponseModel> SignUpProvider(String Name, String email,
      String password, String confirmPassword, String commercialNumber) async {
    final url = Uri.parse('$baseUrl/register_service_provider');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(SignUpProviderRequestModel(
              Name: Name,
              email: email,
              password: password,
              confirmPassword: confirmPassword,
              commercialNumber: commercialNumber)
          .toJson()),
    );

    if (response.statusCode == 200) {
      return SignUpProviderResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode.toString());
      throw Exception('Failed to signUp');
    }
  }
}
