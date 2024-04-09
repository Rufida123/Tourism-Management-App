import 'package:bloc/bloc.dart';
import 'package:tourism_app/data/web_service/user/account_verification_web.dart';
import 'package:tourism_app/pages/User/cubits/verification_cubit/account_verification_state.dart';

class UserAccVerifiCubit extends Cubit<UserAccVerificationState> {
  final AccVerifiUserWeb accVerifiUserWeb;
  UserAccVerifiCubit(this.accVerifiUserWeb) : super(UserAccVerifiInitial());
  Future<void> cubitUserAccVerifi(String code, String email) async {
    emit(UserAccVerifiLoading());
    try {
      final user = await accVerifiUserWeb.accVerifiUser(email, code);

      print(user.message);

      emit(UserAccVerifiSuccess(user));
    } on Exception catch (e) {
      emit(UserAccVerifiFailure(e.toString()));
    }
  }
}
