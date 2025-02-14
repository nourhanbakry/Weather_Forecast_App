import 'package:cellula_project/features/sign_up/domain/entities/sign_up_user_entity.dart';
import 'package:cellula_project/features/sign_up/domain/repositories/sign_up_interface.dart';

class SignUpUsecase {
  final SignUpInterface signUpInterface;

  SignUpUsecase({required this.signUpInterface});

  Future<SignUpUserEntity> signUpUsecase(
      String name, String email, String password) {
    return signUpInterface.signUpInterface(name, email, password);
  }
}
