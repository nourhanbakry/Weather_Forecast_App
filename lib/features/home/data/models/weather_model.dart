import 'package:cellula_project/features/home/domain/entities/wether_data_entity.dart';
// For one
class WeatherModel extends WeatherDataEntity {
  WeatherModel({
    required super.maxWindKph,
    required super.avgHumidity,
    required super.avgTempC,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      maxWindKph: (json['day']['maxwind_kph'] as num).toDouble(),
      avgHumidity: (json['day']['avghumidity'] as num).toDouble(),
      avgTempC: (json['day']['avgtemp_c'] as num).toDouble(),
    );
  }
}


// I want to  collect them in list
class WeatherForecastModel {
  final List<WeatherModel> forecastDays;

  WeatherForecastModel({required this.forecastDays});

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    final List forecastList = json['forecast']['forecastday'];

    return WeatherForecastModel(
      forecastDays:
          forecastList.map((day) => WeatherModel.fromJson(day)).toList(),
    );
  }
}
