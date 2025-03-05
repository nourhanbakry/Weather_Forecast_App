import 'package:cellula_project/core/error/exceptions.dart';
import 'package:cellula_project/core/networking/api_interceptors.dart';
import 'package:cellula_project/core/networking/api_services.dart';
import 'package:cellula_project/core/networking/networking_constants.dart';
import 'package:dio/dio.dart';

class DioHelper extends ApiServices {
  final Dio dio;

  DioHelper({required this.dio}) {
    dio.options.baseUrl = NetworkingConstants.baseURL;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  @override
  Future get(
    String path, {
    data,
    Map<String, dynamic>? queryParmetars,
  }) async {
    try {
      final responce = await dio.get(
        path,
        data: data,
        queryParameters: queryParmetars,
      );
      return responce.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }

  }

  

}
