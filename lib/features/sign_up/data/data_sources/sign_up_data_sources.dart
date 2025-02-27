import 'package:cellula_project/core/networking/firbase_services.dart';
import 'package:cellula_project/core/networking/networking_constants.dart';
import 'package:cellula_project/features/sign_up/data/models/sign_up_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpDataSourcesAbstract {
  Future<SignUpUserModel> signUp(String name, String email, String password);
}

class SignUpDataSourcesImpl extends SignUpDataSourcesAbstract {
  final FirebaseAuth firebaseAuth = FirbaseServices.authInstance;
  final FirebaseFirestore firestore = FirbaseServices.firestore;

  @override
  Future<SignUpUserModel> signUp(
      String name, String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user!.updateDisplayName(name);

      String uid = credential.user!.uid;

      await firestore
          .collection(NetworkingConstants.usersCollection)
          .doc(uid)
          .set(
            {
              'name':name,
              'email':email,
            }
          );

      return SignUpUserModel(
        uid: credential.user!.uid,
        name: name,
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'the provided password is weak';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'email is already in use';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'the provided email is invalid';
      } else {
        errorMessage = 'something went wrong: ${e.message}';
      }
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('unexpected error: $e');
    }
  }
}
