import 'package:bloc/bloc.dart';
import 'package:tourism_app/data/web_service/user/signUp_web.dart';
import 'package:tourism_app/pages/User/cubits/signup_cubit/cubit/signup_state.dart';

class SignUpUserCubit extends Cubit<SignUpUserState> {
  final SignUpUserWeb signUpUserWeb;
  SignUpUserCubit(this.signUpUserWeb) : super(SignUpUserInitial());

  Future<void> cubitUserSignUP(String email, String firstName, String lastName,
      String password, String confirmPassword, String phone) async {
    emit(SignUpUserLoading());
    try {
      final user = await signUpUserWeb.SignUpUser(
          email, firstName, lastName, password, confirmPassword, phone);
      print(user.message);

      emit(SignUpUserSuccess(user));
    } on Exception catch (e) {
      emit(SignUpUserFailure(e.toString()));
    }
  }
}
