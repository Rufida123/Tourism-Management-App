import 'package:tourism_app/data/models/service_provider_models/login_model.dart';

abstract class LoginProviderState {}

class LoginProviderInitial extends LoginProviderState {}

class LoginProviderLoading extends LoginProviderState {}

class LoginProviderSuccess extends LoginProviderState {
  final LoginProviderResponseModel provider;

  LoginProviderSuccess(this.provider);
}

class LoginProviderFailure extends LoginProviderState {
  final String errorMessage;

  LoginProviderFailure(this.errorMessage);
}
