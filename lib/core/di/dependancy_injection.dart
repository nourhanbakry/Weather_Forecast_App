import 'package:cellula_project/core/networking/dio_helper.dart';
import 'package:cellula_project/core/networking/firbase_services.dart';
import 'package:cellula_project/features/home/data/data_services/weather_data_services.dart';
import 'package:cellula_project/features/home/data/repo/weather_repo_impl.dart';
import 'package:cellula_project/features/home/domain/repo_interfaces/weather_repo_interface.dart';
import 'package:cellula_project/features/home/domain/usecase/weather_usecase.dart';
import 'package:cellula_project/features/home/presenation/logic/prediction_cubit.dart';
import 'package:cellula_project/features/home/presenation/logic/weather_cubit.dart';
import 'package:cellula_project/features/login/data/data_sources/login_data_source.dart';
import 'package:cellula_project/features/login/data/repos/login_repo_impl.dart';
import 'package:cellula_project/features/login/domain/repositories/login_interface.dart';
import 'package:cellula_project/features/login/domain/usecases/login_usecase.dart';
import 'package:cellula_project/features/login/presentation/Logic/login_cubit.dart';
import 'package:cellula_project/features/sign_up/Presenation/Logic/sign_up_cubit.dart';
import 'package:cellula_project/features/sign_up/data/data_sources/sign_up_data_sources.dart';
import 'package:cellula_project/features/sign_up/data/repos/sign_up_repo_impl.dart';
import 'package:cellula_project/features/sign_up/domain/repositories/sign_up_interface.dart';
import 'package:cellula_project/features/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<FirbaseServices>(() => getIt<FirbaseServices>());
  //sign up
  getIt.registerLazySingleton<SignUpDataSourcesAbstract>(
      () => SignUpDataSourcesImpl());
  getIt.registerLazySingleton<SignUpInterface>(
      () => SignUpRepoImpl(signUpDataSourcesAbstract: getIt()));
  getIt.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecase(signUpInterface: getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(signUpUsecase: getIt()));

  //login
  getIt.registerLazySingleton<LoginDataSourceAbstract>(
      () => LoginDataSourceImpl());
  getIt.registerLazySingleton<LoginInterface>(
      () => LoginRepoImpl(loginDataSourceAbstract: getIt()));
  getIt.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(loginInterface: getIt()));
  getIt.registerLazySingleton<LoginCubit>(
      () => LoginCubit(loginUsecase: getIt()));

  // home
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioHelper>(() => DioHelper(dio: getIt<Dio>()));
  getIt.registerLazySingleton<WeatherDataServicesAbstract>(
      () => WeatherDataServicesImpl(dioHelper: getIt()));
  getIt.registerLazySingleton<WeatherRepoInterface>(
      () => WeatherRepoImpl(weatherDataServicesAbstract: getIt()));
  getIt.registerLazySingleton<WeatherUsecase>(
      () => WeatherUsecase(weatherRepoInterface: getIt()));
  getIt.registerLazySingleton<WeatherCubit>(() => WeatherCubit(weatherUsecase: getIt()));
  getIt.registerLazySingleton<PredictionCubit>(() => PredictionCubit(weatherUsecase: getIt()));
}
