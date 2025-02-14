import 'package:cellula_project/features/login/domain/entities/login_user_entity.dart';
import 'package:cellula_project/features/login/domain/repositories/login_interface.dart';

class LoginUsecase {
  final LoginInterface loginInterface;

  LoginUsecase({required this.loginInterface});

 Future<LoginUserEntity> loginUseCase({required String email, required String password}) {
    return loginInterface.logIn(email: email, password: password);
  }
}
