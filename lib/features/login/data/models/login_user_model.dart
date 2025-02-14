import 'package:cellula_project/features/login/domain/entities/login_user_entity.dart';

class LoginUserModel extends LoginUserEntity {
  LoginUserModel({required super.email, required super.password});

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(email: json['email'], password: json['password']);
  }

  toJson() {
    return {
      'email':email,
      'password':password,
    };
  }
}
