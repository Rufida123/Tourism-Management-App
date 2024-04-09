import 'package:flutter/material.dart';
import 'package:tourism_app/data/models/user_models/account_verification_model.dart';

@immutable
abstract class UserAccVerificationState {}

final class UserAccVerifiInitial extends UserAccVerificationState {}

final class UserAccVerifiLoading extends UserAccVerificationState {}

final class UserAccVerifiSuccess extends UserAccVerificationState {
  final AccVerifiUserResponseModel user;

  UserAccVerifiSuccess(this.user);
}

final class UserAccVerifiFailure extends UserAccVerificationState {
  final String message;

  UserAccVerifiFailure(this.message);
}
