import 'package:cellula_project/features/login/domain/usecases/login_usecase.dart';
import 'package:cellula_project/features/login/presentation/Logic/login_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.loginUsecase}) : super(InitalLoginState());
  final LoginUsecase loginUsecase;

  login({required String email, required String password})async {
    emit(LoadingLoginState());
    try {
      final user =await loginUsecase.loginUseCase(email: email, password: password);
      emit(SuccessLoginState(loginUserEntity: user));
    } catch (e) {
      debugPrint(e.toString());
      emit(FailureLoginState(errorMessage: e.toString()));
      return e;
    }
  }
}
