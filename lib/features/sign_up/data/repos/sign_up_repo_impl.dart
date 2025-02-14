import 'package:cellula_project/features/sign_up/data/data_sources/sign_up_data_sources.dart';
import 'package:cellula_project/features/sign_up/domain/entities/sign_up_user_entity.dart';
import 'package:cellula_project/features/sign_up/domain/repositories/sign_up_interface.dart';

class SignUpRepoImpl implements SignUpInterface {
  final SignUpDataSourcesAbstract signUpDataSourcesAbstract;

  SignUpRepoImpl({required this.signUpDataSourcesAbstract});
  @override
  Future<SignUpUserEntity> signUpInterface(
      String name, String email, String password) {
    return signUpDataSourcesAbstract.signUp(name, email, password);
  }
}
