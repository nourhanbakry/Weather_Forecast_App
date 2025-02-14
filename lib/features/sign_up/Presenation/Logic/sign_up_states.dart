import 'package:cellula_project/features/sign_up/domain/entities/sign_up_user_entity.dart';

class SignUpStates {}

class InitalSignUpState extends SignUpStates{}

class SucessSignUpState extends SignUpStates {
  final SignUpUserEntity signUpUserEntity;

  SucessSignUpState({required this.signUpUserEntity});
}

class LoadingSignUpState extends SignUpStates {}

class FailureSignUpState extends SignUpStates {
  final String errorMessage;

  FailureSignUpState({required this.errorMessage});
}
