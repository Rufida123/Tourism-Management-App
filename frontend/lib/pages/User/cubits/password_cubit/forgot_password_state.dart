import 'package:flutter/material.dart';
import 'package:tourism_app/data/models/user_models/forgot_password_model.dart';

@immutable
sealed class UserForgotPasswordState {}

final class UserForgotPasswordInitial extends UserForgotPasswordState {}

final class UserForgotPasswordLoading extends UserForgotPasswordState {}

final class UserForgotPasswordSuccess extends UserForgotPasswordState {}

final class UserForgotPasswordFailure extends UserForgotPasswordState {
  final String message;

  UserForgotPasswordFailure(this.message);
}
