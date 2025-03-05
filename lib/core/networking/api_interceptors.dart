import 'package:cellula_project/core/networking/networking_constants.dart';
import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[NetworkingConstants.acceptHeaders] = 'application/json';
    super.onRequest(options, handler);
  }
}
