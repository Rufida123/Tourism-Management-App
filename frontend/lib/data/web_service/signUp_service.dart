import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tourism_app/data/model/signupModel.dart';

class SignUpWebService {
  Future<UserSignUp> SignUp(String firstName, String lastName, String email,
      String password, String confirmPassword) async {
    final url = Uri.parse('http://192.168.1.105:8000/api/signup_user');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(SignUpModel(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password,
              confirmPassword: confirmPassword)
          .toJson()),
    );

    if (response.statusCode == 200) {
      return UserSignUp.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode.toString());
      throw Exception('Failed to signUp');
    }
  }
}
