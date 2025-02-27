import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirbaseServices {
  FirbaseServices._();

  static FirebaseAuth authInstance = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

}
