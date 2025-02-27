import 'package:cellula_project/core/networking/networking_constants.dart';

class ErrorModel {
  final int code;
  final String message;

  ErrorModel({required this.code, required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      code: json[NetworkingConstants.error][NetworkingConstants.code],
      message: json[NetworkingConstants.error][NetworkingConstants.message],
    );
  }
}
