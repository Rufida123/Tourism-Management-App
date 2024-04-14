import 'package:flutter/material.dart';
import 'package:tourism_app/data/models/service_provider_models/account_verification_model.dart';

@immutable
abstract class ProviderAccVerificationState {}

final class ProviderAccVerifiInitial extends ProviderAccVerificationState {}

final class ProviderAccVerifiLoading extends ProviderAccVerificationState {}

final class ProviderAccVerifiSuccess extends ProviderAccVerificationState {
  
}

final class ProviderAccVerifiFailure extends ProviderAccVerificationState {
  final String errorMessage;

  ProviderAccVerifiFailure(this.errorMessage);
}
