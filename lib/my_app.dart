import 'package:cellula_project/core/constants/app_colors.dart';
import 'package:cellula_project/core/networking/firbase_services.dart';
import 'package:cellula_project/core/routing/app_router.dart';
import 'package:cellula_project/core/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final FirebaseAuth auth = FirbaseServices.authInstance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: auth.currentUser != null
          ? Routes.home
          : Routes.authSelection,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.naivyBlue),
    );
  }
}
