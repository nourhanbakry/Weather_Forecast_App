import 'dart:convert';
import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/core/error/exceptions.dart';
import 'package:cellula_project/core/helper/shared_prefrances_helper.dart';
import 'package:cellula_project/core/networking/dio_helper.dart';
import 'package:cellula_project/core/networking/networking_constants.dart';
import 'package:cellula_project/features/home/data/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class WeatherDataServicesAbstract {
  Future<WeatherForecastModel> getWeatherData();
  Future getPrediction(List<int> features);
}

class WeatherDataServicesImpl implements WeatherDataServicesAbstract {
  final DioHelper dioHelper;

  WeatherDataServicesImpl({required this.dioHelper});

  @override
  Future<WeatherForecastModel> getWeatherData() async {
    try {
      final double? lat =
          await SharedPreferencesHelper.getDouble(AppStrings.latitude);
      final double? long =
          await SharedPreferencesHelper.getDouble(AppStrings.longtude);

      final response = await dioHelper.get(
        NetworkingConstants.forcastEP,
        queryParmetars: {
          'q': '$lat,$long',
          'days': 3,
          'key': NetworkingConstants.apiKey,
        },
      );

      debugPrint(response.toString());

      return WeatherForecastModel.fromJson(response);
    } on ServerExceptions catch (e) {
      debugPrint(e.errorModel.message);
      throw e.errorModel.message;
    } catch (e) {
      debugPrint("Unexpected error: $e");
      throw Exception("Failed to fetch weather data");
    }
  }

  @override
  Future<int> getPrediction(List<int> features) async {
    try {
      print("Starrttinggggggg");
      final response = await dioHelper.dio.post(
        'http://10.0.2.2:5001/predict',
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: jsonEncode({'features': features}),
      );
      print("Senddding");
      print(response.data);

      if (response.statusCode == 200) {
        final prediction = response.data['prediction'][0];
        if (prediction is int) {
          print('Prediction: $prediction');
          return prediction;
        } else {
          print('Invalid prediction format: $prediction');
          return -1;
        }
      } else {
        print('Failed to get prediction');
        return response.statusCode!;
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
