import 'package:cellula_project/features/home/domain/entities/wether_data_entity.dart';

abstract class WeatherRepoInterface {
  Future<List<WeatherDataEntity>> getWeatherForecast();
  Future<int> getPredicition(List<int> features);
}
