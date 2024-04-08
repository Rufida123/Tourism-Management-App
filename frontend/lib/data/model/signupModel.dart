class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.confirmPassword});

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}

class UserSignUp {
  final String message;

  UserSignUp({required this.message});

  factory UserSignUp.fromJson(Map<String, dynamic> json) {
    return UserSignUp(message: json['message']);
  }
}
