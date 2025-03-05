import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/core/helper/shared_prefrances_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

Future determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Position position = await Geolocator.getCurrentPosition();
  debugPrint("Lat is ${position.latitude}, Long is  ${position.longitude}");

  SharedPreferencesHelper.setDouble(AppStrings.latitude, position.latitude);
  SharedPreferencesHelper.setDouble(AppStrings.longtude, position.longitude);
  return position;
}
