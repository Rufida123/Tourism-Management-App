import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:tourism_app/data/web_service/user/login_web.dart';
import 'package:tourism_app/pages/User/cubits/login_cubit/login_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  final LoginUserWeb loginUserWeb;

  LoginUserCubit(this.loginUserWeb) : super(LoginUserInitial());

  Future<void> cubitUserLogin(String email, String password) async {
    emit(LoginUserLoading());
    try {
      await loginUserWeb.loginUser(email, password);

      emit(LoginUserSuccess());
    } on WrongPasswordOrNotVerifiedException {
      emit(LoginUserFailure(
          'The password is wrong or the email is not verified.'));
    } on InvalidEmailException {
      emit(LoginUserFailure('The selected email is invalid.'));
    } on SocketException {
      emit(LoginUserFailure('No internet connection.'));
    } on Exception catch (e) {
      emit(LoginUserFailure(e.toString()));
    }
  }
}
