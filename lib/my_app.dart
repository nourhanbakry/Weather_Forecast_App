import 'package:cellula_project/core/constants/app_colors.dart';
import 'package:cellula_project/core/routing/app_router.dart';
import 'package:cellula_project/core/routing/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: Routes.authSelection,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.naivyBlue),
    );
  }
}
