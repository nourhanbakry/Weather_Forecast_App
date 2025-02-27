import 'package:cellula_project/features/home/domain/entities/wether_data_entity.dart';

class WeatherStates {}

class InitalWeatherState extends WeatherStates {}

class SuccessWeatherState extends WeatherStates {
  final List<WeatherDataEntity> weatherData;

  SuccessWeatherState({required this.weatherData});
}

class LoadingWeatherState extends WeatherStates {}

class FailureWeatherState extends WeatherStates {
  final String errorMessage;

  FailureWeatherState({required this.errorMessage});
}


