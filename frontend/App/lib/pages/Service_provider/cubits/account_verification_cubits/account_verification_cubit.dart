import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/data/web_service/service_provider/account_verification_web.dart';
import 'package:tourism_app/pages/Service_provider/cubits/account_verification_cubits/account_verification_state.dart';

class ProviderAccVerifiCubit extends Cubit<ProviderAccVerificationState> {
  final AccVerifiProviderWeb accVerifiProviderWeb;
  ProviderAccVerifiCubit(this.accVerifiProviderWeb)
      : super(ProviderAccVerifiInitial());
  Future<void> cubitProviderAccVerifi(String code, String email) async {
    emit(ProviderAccVerifiLoading());
    try {
      await accVerifiProviderWeb.accVerifiUser(code, email);
      emit(ProviderAccVerifiSuccess());
    } on Exception catch (e) {
      emit(ProviderAccVerifiFailure(e.toString()));
    }
  }
}
