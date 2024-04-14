import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/data/web_service/user/forgot_password_web.dart';
import 'package:tourism_app/pages/User/cubits/password_cubit/forgot_password_state.dart';

class UserForgotPasswordCubit extends Cubit<UserForgotPasswordState> {
  final UserForgotPassWeb providerForgotPassWeb;
  UserForgotPasswordCubit(this.providerForgotPassWeb)
      : super(UserForgotPasswordInitial());
  Future<void> cubitUserForgotPassword(String email) async {
    emit(UserForgotPasswordLoading());
    try {
      await providerForgotPassWeb.userForgotPass(email);

      emit(UserForgotPasswordSuccess());
    } on Exception catch (e) {
      emit(UserForgotPasswordFailure(e.toString()));
    }
  }
}
