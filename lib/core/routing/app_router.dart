import 'package:cellula_project/core/di/dependancy_injection.dart';
import 'package:cellula_project/core/routing/routes.dart';
import 'package:cellula_project/features/auth_selection/auth_selection_screen.dart';
import 'package:cellula_project/features/home/presenation/logic/prediction_cubit.dart';
import 'package:cellula_project/features/home/presenation/logic/weather_cubit.dart';
import 'package:cellula_project/features/home/presenation/ui/screens/home_screen.dart';
import 'package:cellula_project/features/login/presentation/Logic/login_cubit.dart';
import 'package:cellula_project/features/login/presentation/UI/screens/login_screen.dart';
import 'package:cellula_project/features/sign_up/Presenation/Logic/sign_up_cubit.dart';
import 'package:cellula_project/features/sign_up/Presenation/UI/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.authSelection:
        return MaterialPageRoute(builder: (_) => AuthSelectionScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(loginUsecase: getIt()),
            child: LoginScreen(),
          ),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignUpCubit(signUpUsecase: getIt()),
            child: SignUpScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => WeatherCubit(weatherUsecase: getIt()),
              ),
              BlocProvider(
                create: (context) => PredictionCubit(weatherUsecase: getIt()),
              ),
            ],
            child: HomeScreen(),
          ),
        );
    }
    return null;
  }
}
