import 'package:cellula_project/features/login/data/data_sources/login_data_source.dart';
import 'package:cellula_project/features/login/domain/entities/login_user_entity.dart';
import 'package:cellula_project/features/login/domain/repositories/login_interface.dart';

class LoginRepoImpl implements LoginInterface {
  final LoginDataSourceAbstract loginDataSourceAbstract;
  LoginRepoImpl({required this.loginDataSourceAbstract});
  @override
  Future<LoginUserEntity> logIn(
      {required String email, required String password}) {
    return loginDataSourceAbstract.login(email: email, password: password);
  }
}
