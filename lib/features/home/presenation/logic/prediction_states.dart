// weather prediction
 class WeatherPredctitionStates{}

class InitalWeatherPredictionState extends WeatherPredctitionStates{}

class SuccessWeatherPredictionState extends WeatherPredctitionStates {
  final int predcition;

  SuccessWeatherPredictionState({required this.predcition});
}

class LoadingWeatherPredictionState extends WeatherPredctitionStates{}

class FailureWeatherPredicitionState extends WeatherPredctitionStates {
  final String errorMessage;

  FailureWeatherPredicitionState({required this.errorMessage});
}