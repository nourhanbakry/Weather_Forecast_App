import 'package:cellula_project/features/login/domain/entities/login_user_entity.dart';

abstract class LoginInterface {
 Future<LoginUserEntity> logIn({required String email, required String password});
}
