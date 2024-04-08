import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/data/web_service/service_provider/login_web.dart';
import 'package:tourism_app/pages/Service_provider/cubits/login_cubit/login_state.dart';

class LoginProviderCubit extends Cubit<LoginProviderState> {
  final LoginProviderWeb loginProviderWeb;

  LoginProviderCubit(this.loginProviderWeb) : super(LoginProviderInitial());

  Future<void> cubitProviderLogin(String email, String password) async {
    emit(LoginProviderLoading());
    try {
      final provider = await loginProviderWeb.loginProvider(email, password);

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
      emit(LoginProviderSuccess(provider));
    } on Exception catch (e) {
      emit(LoginProviderFailure(e.toString()));
    }
  }
}
