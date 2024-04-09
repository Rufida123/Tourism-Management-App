import 'package:bloc/bloc.dart';
import 'package:tourism_app/data/web_service/user/login_web.dart';
import 'package:tourism_app/pages/User/cubits/login_cubit/login_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  final LoginUserWeb loginUserWeb;

  LoginUserCubit(this.loginUserWeb) : super(LoginUserInitial());

  Future<void> cubitUserLogin(String email, String password) async {
    emit(LoginUserLoading());
    try {
      final user = await loginUserWeb.loginUser(email, password);

      print(user.message);
      emit(LoginUserSuccess(user));
    } on Exception catch (e) {
      emit(LoginUserFailure(e.toString()));
    }
  }
}
