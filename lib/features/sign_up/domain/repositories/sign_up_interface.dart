import 'package:cellula_project/features/sign_up/domain/entities/sign_up_user_entity.dart';

abstract class SignUpInterface {
  Future<SignUpUserEntity> signUpInterface(String name,String email,String password);
}
