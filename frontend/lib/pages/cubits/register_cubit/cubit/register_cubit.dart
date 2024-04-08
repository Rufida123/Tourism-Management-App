import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/data/model/loginModel.dart';
import 'package:tourism_app/data/model/signupModel.dart';
import 'package:tourism_app/data/web_service/signUp_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final SignUpWebService SignUpService;
  RegisterCubit(this.SignUpService) : super(RegisterInitial());

  Future<void> cubitSignUP(String firstName, String lastName, String email,
      String password, String confirmPassword) async {
    emit(RegisterLoading());
    try {
      final user = await SignUpService.SignUp(
          firstName, lastName, email, password, confirmPassword);
      final prefs = await SharedPreferences.getInstance();
      final String? message = prefs.getString('message');

      emit(RegisterSuccess(user));
    } on Exception catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
