class LoginUserRequestModel {
  final String email;
  final String password;

  LoginUserRequestModel({required this.email, required this.password});

  Map<String, String> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginUserRespnseModel {
  final String token;
  final String message;
  final int status;

  LoginUserRespnseModel(
      {required this.token, required this.message, required this.status});

  factory LoginUserRespnseModel.fromJson(Map<String, dynamic> json) {
    return LoginUserRespnseModel(
        token: json['token'],
        message: json['message'].toString(),
        status: json['status']);
  }
}
