import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tourism_app/constants/constants.dart';
import 'package:tourism_app/data/models/user_models/signupModel.dart';

class SignUpUserWeb {
  Future<SignUPUserResponseModel> SignUpUser(
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String phone) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(SignUpUserRequestModel(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password,
              confirmPassword: confirmPassword,
              phone: phone)
          .toJson()),
    );

    if (response.statusCode == 200) {
      return SignUPUserResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode.toString());
      throw Exception('Failed to signUp');
    }
  }
}
