import 'package:cellula_project/features/sign_up/domain/entities/sign_up_user_entity.dart';

class SignUpUserModel extends SignUpUserEntity {
  SignUpUserModel(
      {required super.uid, required super.name, required super.email});

  factory SignUpUserModel.fromJson(Map<String, dynamic> json) {
    return SignUpUserModel(
        uid: json['uid'], name: json['name'], email: json['email']);
  }

  Map<String,dynamic> toJson() {
    return {
      'uid':uid,
      'name':name,
      'email':email,
    };
  }
}
