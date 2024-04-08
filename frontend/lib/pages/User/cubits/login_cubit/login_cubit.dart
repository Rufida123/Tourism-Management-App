import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/data/web_service/user/login_web.dart';
import 'package:tourism_app/pages/User/cubits/login_cubit/login_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  final LoginUserWeb loginUserWeb;

  LoginUserCubit(this.loginUserWeb) : super(LoginUserInitial());

  Future<void> cubitUserLogin(String email, String password) async {
    emit(LoginUserLoading());
    try {
      final user = await loginUserWeb.loginUser(email, password);

      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      final String? message = prefs.getString('message');
      final int? statusCode = prefs.getInt('status');

      if (message != null && statusCode != null && token != null) {
        print('Saved message: $message');
        print('Saved status code: $statusCode');
        print('Saved token: $token');
      } else {
        print('No token or message or status code saved in SharedPreferences.');
      }
      emit(LoginUserSuccess(user));
    } on Exception catch (e) {
      emit(LoginUserFailure(e.toString()));
    }
  }
}
