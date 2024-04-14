import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/data/web_service/user/password_reset_web.dart';
import 'package:tourism_app/pages/User/cubits/password_cubit/password_reset_state.dart';

class UserPassResetCubit extends Cubit<UserPassResetState> {
  final UserPassResetWeb userPassResetWeb;
  UserPassResetCubit(this.userPassResetWeb) : super(UserPassResetInitial());
  Future<void> cubitUserPassReset(
      String code, String password, String passwordConfirmation) async {
    emit(UserPassResetLoading());
    try {
      await userPassResetWeb.userPassReset(
          code, password, passwordConfirmation);
      emit(UserPassResetSuccess());
    } on Exception catch (e) {
      emit(UserPassResetFailure(e.toString()));
    }
  }
}
