class SignUpUserRequestModel {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String confirmPassword;
  final String phone;

  SignUpUserRequestModel(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.password,
      required this.confirmPassword,
      required this.phone});

  Map<String, String> toJson() {
    return {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'password_confirmation': confirmPassword,
      'phone': phone
    };
  }
}

class SignUPUserResponseModel {
  final String message;

  SignUPUserResponseModel({required this.message});

  factory SignUPUserResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUPUserResponseModel(message: json['message']);
  }
}
