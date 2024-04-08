import 'package:flutter/foundation.dart';
import 'package:tourism_app/data/models/service_provider_models/sign_up_model.dart';

@immutable
abstract class SignUpProviderState {}

final class SignUpProviderInitial extends SignUpProviderState {}

final class SignUpProviderSuccess extends SignUpProviderState {
  final SignUpProviderResponseModel user;

  SignUpProviderSuccess(this.user);
}

final class SignUpProviderLoading extends SignUpProviderState {}

final class SignUpProviderFailure extends SignUpProviderState {
  final String errorMessage;

  SignUpProviderFailure(this.errorMessage);
}
