class AccVerifiProviderRequestModel {
  String email;
  String code;
  AccVerifiProviderRequestModel({
    required this.email,
    required this.code,
  });
  Map<String, String> toJson() {
    return {
      'email': email,
      'code': code,
    };
  }
}

class AccVerifiProviderResponseModel {
  final String message;

  AccVerifiProviderResponseModel({required this.message});

  factory AccVerifiProviderResponseModel.fromJson(Map<String, String> json) {
    return AccVerifiProviderResponseModel(message: json['message'].toString());
  }
}
