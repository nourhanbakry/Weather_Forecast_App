import 'package:cellula_project/features/login/domain/entities/login_user_entity.dart';

class LoginStates {}

class InitalLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {
  final LoginUserEntity loginUserEntity;

  SuccessLoginState({required this.loginUserEntity});
}

class LoadingLoginState extends LoginStates {}

class FailureLoginState extends LoginStates {
  final String errorMessage;

  FailureLoginState({required this.errorMessage});
}
