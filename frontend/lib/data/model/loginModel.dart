class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class UserLogin {
  final String token;
  final String message;
  final int status;

  UserLogin({required this.token, required this.message, required this.status});

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
        token: json['token'], message: json['message'], status: json['status']);
  }
}
