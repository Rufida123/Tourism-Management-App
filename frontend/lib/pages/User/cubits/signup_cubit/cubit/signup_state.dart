import 'package:flutter/foundation.dart';
import 'package:tourism_app/data/models/user_models/signupModel.dart';

@immutable
abstract class SignUpUserState {}

final class SignUpUserInitial extends SignUpUserState {}

final class SignUpUserSuccess extends SignUpUserState {
  final SignUPUserResponseModel user;

  SignUpUserSuccess(this.user);
}

final class SignUpUserLoading extends SignUpUserState {}

final class SignUpUserFailure extends SignUpUserState {
  final String errorMessage;

  SignUpUserFailure(this.errorMessage);
}
