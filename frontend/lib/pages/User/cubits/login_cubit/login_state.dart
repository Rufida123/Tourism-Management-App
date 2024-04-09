import 'package:tourism_app/data/models/user_models/loginModel.dart';

abstract class LoginUserState {}

class LoginUserInitial extends LoginUserState {}

class LoginUserLoading extends LoginUserState {}

class LoginUserSuccess extends LoginUserState {
  final LoginUserRespnseModel user;

  LoginUserSuccess(this.user);
}

class LoginUserFailure extends LoginUserState {
  final String message;

  LoginUserFailure(this.message);
}
