class SignUpUserRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;

  SignUpUserRequestModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.phone});

  Map<String, String> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password confirmation': confirmPassword,
      'phone': phone
    };
  }
}

class SignUPUserResponseModel {
  final String message;

  SignUPUserResponseModel({required this.message});

  factory SignUPUserResponseModel.fromJson(Map<String, String> json) {
    return SignUPUserResponseModel(message: json['message'].toString());
  }
}
