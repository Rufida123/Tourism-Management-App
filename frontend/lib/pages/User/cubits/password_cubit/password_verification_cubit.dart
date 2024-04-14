import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/data/web_service/user/password_verification_web.dart';
import 'package:tourism_app/pages/User/cubits/password_cubit/password_verification_state.dart';

class UserPassVerifiCubit extends Cubit<UserPassVerifiState> {
  final UserPassVerifiWeb userPassVerifiWeb;
  UserPassVerifiCubit(this.userPassVerifiWeb) : super(UserPassVerifiInitial());
  Future<void> cubitUserPassVerifi(String code, String email) async {
    emit(UserPassVerifiLoading());
    try {
      await userPassVerifiWeb.userPassVerifi(code, email);
      emit(UserPassVerifiSuccess());
    } on Exception catch (e) {
      emit(UserPassVerifiFailure(e.toString()));
    }
  }
}
