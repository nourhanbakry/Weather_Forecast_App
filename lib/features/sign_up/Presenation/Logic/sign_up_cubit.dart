import 'package:cellula_project/features/sign_up/Presenation/Logic/sign_up_states.dart';
import 'package:cellula_project/features/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final SignUpUsecase signUpUsecase;
  SignUpCubit({required this.signUpUsecase}) : super(InitalSignUpState());

  signUp({required String name, required String email, required String password}) async {
    emit(LoadingSignUpState());
    try {
      final user = await signUpUsecase.signUpUsecase(name, email, password);
      emit(SucessSignUpState(signUpUserEntity: user));
    } catch (e) {
      emit(FailureSignUpState(errorMessage: e.toString()));
    }
  }
}
