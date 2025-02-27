import 'package:cellula_project/features/home/domain/entities/wether_data_entity.dart';
import 'package:cellula_project/features/home/domain/repo_interfaces/weather_repo_interface.dart';

class WeatherUsecase {
  final WeatherRepoInterface weatherRepoInterface;

  WeatherUsecase({required this.weatherRepoInterface});

  Future<List<WeatherDataEntity>> getWeatherUseCase() async {
    return await weatherRepoInterface.getWeatherForecast();
  }

  List<List<int>> getWeatherIndicators(
      List<WeatherDataEntity> weatherDataList) {
    return weatherDataList.map((weather) {
      return [
        weather.avgTempC <= 27 ? 1 : 0, // rainy
        weather.avgTempC > 27 ? 1 : 0, // sunny
        weather.avgTempC > 27 ? 1 : 0, // hot
        weather.avgTempC <= 27 ? 1 : 0, // mild
        weather.avgHumidity <= 50 ? 1 : 0, // normal
      ];
    }).toList();
  }

  Future<int> getPrediction(int day) async {
    final weatherDataList = await getWeatherUseCase();
    final featuresList = getWeatherIndicators(weatherDataList);

    final selectedFeatures = featuresList[day];
    print(selectedFeatures[day]);
    print("day is $day");

    return await weatherRepoInterface.getPredicition(selectedFeatures);
  }
}
