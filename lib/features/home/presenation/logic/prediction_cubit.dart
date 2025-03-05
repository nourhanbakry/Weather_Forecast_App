import 'package:cellula_project/features/home/domain/usecase/weather_usecase.dart';
import 'package:cellula_project/features/home/presenation/logic/prediction_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PredictionCubit extends Cubit<WeatherPredctitionStates> {
    final WeatherUsecase weatherUsecase;

  PredictionCubit({required this.weatherUsecase}) : super(InitalWeatherPredictionState());
  
  Future<void> getPrediction(int day) async {
    emit(LoadingWeatherPredictionState());
    print("Loaddddddddddddddddddddddding");
    try {
      final int prediction = await weatherUsecase.getPrediction(day);
      print("the predictt is $prediction");
      print("Senddddddddddddddddddddddddedddddddd");
      emit(SuccessWeatherPredictionState(predcition: prediction));
    } catch (e) {
      debugPrint(e.toString());
      emit(FailureWeatherPredicitionState(errorMessage: e.toString()));
    }
  }
}