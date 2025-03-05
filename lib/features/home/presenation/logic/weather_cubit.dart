import 'package:cellula_project/features/home/domain/usecase/weather_usecase.dart';
import 'package:cellula_project/features/home/presenation/logic/weather_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  final WeatherUsecase weatherUsecase;

  WeatherCubit({required this.weatherUsecase}) : super(InitalWeatherState());

  Future<void> fetchWeatherData() async {
    emit(LoadingWeatherState());
    try {
      final weatherData = await weatherUsecase.getWeatherUseCase();
      emit(SuccessWeatherState(weatherData: weatherData));
    } catch (e) {
      debugPrint(e.toString());
      emit(FailureWeatherState(errorMessage: e.toString()));
    }
  }

  
}
