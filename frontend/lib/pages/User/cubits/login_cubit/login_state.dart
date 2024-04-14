import 'package:tourism_app/data/models/user_models/loginModel.dart';

abstract class LoginUserState {}

class LoginUserInitial extends LoginUserState {}

class LoginUserLoading extends LoginUserState {}

class LoginUserSuccess extends LoginUserState {}

class LoginUserFailure extends LoginUserState {
  final String errorMessage;

  LoginUserFailure(this.errorMessage);
}
