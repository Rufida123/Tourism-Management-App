import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/data/web_service/login_service.dart';
import 'package:tourism_app/pages/cubits/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginWebService loginService;

  LoginCubit(this.loginService) : super(LoginInitial());

  Future<void> cubitLogin(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await loginService.login(email, password);

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
      emit(LoginSuccess(user));
    } on Exception catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
