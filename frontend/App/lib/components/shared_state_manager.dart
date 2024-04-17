class UserSharedEmail {
  String? _email;

  void setEmail(String email) {
    _email = email;
  }

  String? getEmail() {
    return _email;
  }
}

final userSharedEmail = UserSharedEmail();

class ProviderSharedEmail {
  String? _email;

  void setEmail(String email) {
    _email = email;
  }

  String? getEmail() {
    return _email;
  }
}

final providerSharedEmail = ProviderSharedEmail();

class UserSharedCode {
  String? _code;

  void setCode(String code) {
    _code = code;
  }

  String? getCode() {
    return _code;
  }
}

final userSharedCode = UserSharedCode();

class ProviderSharedCode {
  String? _code;

  void setCode(String code) {
    _code = code;
  }

  String? getCode() {
    return _code;
  }
}

final providerSharedCode = ProviderSharedCode();
