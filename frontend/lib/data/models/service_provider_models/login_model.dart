class LoginProviderRequestModel {
  final String email;
  final String password;

  LoginProviderRequestModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginProviderResponseModel {
  final String token;
  final String message;
  final int status;

  LoginProviderResponseModel(
      {required this.token, required this.message, required this.status});

  factory LoginProviderResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginProviderResponseModel(
        token: json['token'], message: json['message'], status: json['status']);
  }
}
