import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/data/web_service/service_provider/signUp_web.dart';
import 'package:tourism_app/pages/Service_provider/cubits/sign_up_cubit/sign_up_state.dart';

class SignUpProviderCubit extends Cubit<SignUpProviderState> {
  final SignUpProviderWeb signUpProviderWeb;
  SignUpProviderCubit(this.signUpProviderWeb) : super(SignUpProviderInitial());

  Future<void> cubitProviderSignUP(String email, String Name, String password,
      String confirmPassword, String commercialNumber) async {
    emit(SignUpProviderLoading());
    try {
      final provider = await signUpProviderWeb.SignUpProvider(
          email, Name, password, confirmPassword, commercialNumber);
      final prefs = await SharedPreferences.getInstance();
      final String? message = prefs.getString('message');
      print('$message');

      emit(SignUpProviderSuccess(provider));
    } on Exception catch (e) {
      emit(SignUpProviderFailure(e.toString()));
    }
  }
}
