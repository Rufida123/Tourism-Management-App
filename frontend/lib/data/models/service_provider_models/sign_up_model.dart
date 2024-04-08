class SignUpProviderRequestModel {
  final String Name;
  final String email;
  final String password;
  final String confirmPassword;
  final String commercialNumber;

  SignUpProviderRequestModel(
      {required this.Name,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.commercialNumber});

  Map<String, String> toJson() {
    return {
      'provider_name': Name,
      'email': email,
      'password': password,
      'password confirmation': confirmPassword,
      'commercial_register': commercialNumber
    };
  }
}

class SignUpProviderResponseModel {
  final String message;

  SignUpProviderResponseModel({required this.message});

  factory SignUpProviderResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpProviderResponseModel(message: json['message']);
  }
}
