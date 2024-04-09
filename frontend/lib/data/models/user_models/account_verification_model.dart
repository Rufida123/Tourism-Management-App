class AccVerifiUserRequestModel {
  String email;
  String code;
  AccVerifiUserRequestModel({
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

class AccVerifiUserResponseModel {
  final String message;

  AccVerifiUserResponseModel({required this.message});

  factory AccVerifiUserResponseModel.fromJson(Map<String, String> json) {
    return AccVerifiUserResponseModel(message: json['message'].toString());
  }
}
