import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/core/networking/firbase_services.dart';
import 'package:cellula_project/features/login/data/models/login_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDataSourceAbstract {
  Future<LoginUserModel> login({required String email,required String password});
}

class LoginDataSourceImpl extends LoginDataSourceAbstract {
  final FirebaseAuth firebaseAuth = FirbaseServices.authInstance;
  @override
  Future<LoginUserModel> login({required String email,required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return LoginUserModel(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == AppStrings.userNotFound) {
        errorMessage = AppStrings.userNotFound;
      } else if (e.code == AppStrings.wrongPassword) {
        errorMessage = AppStrings.wrongPassword;
      } else {
        errorMessage = '${e.message}';
      }
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('$e');
    }
  }
}
