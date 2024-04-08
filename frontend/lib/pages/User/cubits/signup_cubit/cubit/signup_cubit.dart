import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/data/web_service/user/signUp_web.dart';
import 'package:tourism_app/pages/User/cubits/signup_cubit/cubit/signup_state.dart';

class SignUpUserCubit extends Cubit<SignUpUserState> {
  final SignUpUserWeb signUpUserWeb;
  SignUpUserCubit(this.signUpUserWeb) : super(SignUpUserInitial());

  Future<void> cubitUserSignUP(String firstName, String lastName, String email,
      String password, String confirmPassword, String phone) async {
    emit(SignUpUserLoading());
    try {
      final user = await signUpUserWeb.SignUpUser(
          firstName, lastName, email, password, confirmPassword, phone);
      final prefs = await SharedPreferences.getInstance();
      final String? message = prefs.getString('message');
      print('$message');

      emit(SignUpUserSuccess(user));
    } on Exception catch (e) {
      emit(SignUpUserFailure(e.toString()));
    }
  }
}
