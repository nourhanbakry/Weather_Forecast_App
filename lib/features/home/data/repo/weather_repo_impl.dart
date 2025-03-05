import 'package:cellula_project/features/home/data/data_services/weather_data_services.dart';
import 'package:cellula_project/features/home/data/models/weather_model.dart';
import 'package:cellula_project/features/home/domain/entities/wether_data_entity.dart';
import 'package:cellula_project/features/home/domain/repo_interfaces/weather_repo_interface.dart';

class WeatherRepoImpl implements WeatherRepoInterface {
  final WeatherDataServicesAbstract weatherDataServicesAbstract;

  WeatherRepoImpl({required this.weatherDataServicesAbstract});

  @override
  Future<List<WeatherDataEntity>> getWeatherForecast() async {
    final WeatherForecastModel weatherForecastModel =
        await weatherDataServicesAbstract.getWeatherData();

    return weatherForecastModel.forecastDays;
  }
  
  @override
  Future<int> getPredicition(List<int> features) async {
   final getWeatherPrediciton =
        await weatherDataServicesAbstract.getPrediction(features);
    return getWeatherPrediciton;
  }

  
}
