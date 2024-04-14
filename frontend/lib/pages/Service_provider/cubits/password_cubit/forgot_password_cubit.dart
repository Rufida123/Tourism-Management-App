import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism_app/data/web_service/service_provider/forgot_password_web.dart';

part 'forgot_password_state.dart';

class ProviderForgotPasswordCubit extends Cubit<ProviderForgotPasswordState> {
  final ProviderForgotPassWeb providerForgotPassWeb;
  ProviderForgotPasswordCubit(this.providerForgotPassWeb)
      : super(ProviderForgotPasswordInitial());
  Future<void> cubitProviderForgotPassword(String email) async {
    emit(ProviderForgotPasswordLoading());
    try {
      await providerForgotPassWeb.providerForgotPass(email);
      emit(ProviderForgotPasswordSuccess());
    } on Exception catch (e) {
      emit(ProviderForgotPasswordFailure(e.toString()));
    }
  }
}
