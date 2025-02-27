import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/features/home/presenation/ui/widgets/custom_prograss.dart';
import 'package:flutter/material.dart';

class WeatherInfoPrograssBars extends StatelessWidget {
  const WeatherInfoPrograssBars({
    super.key,
    required this.prograssTemp,
    required this.prograssHumaditiy,
    required this.prograssWind,
  });
  final double prograssTemp;
  final double prograssHumaditiy;
  final double prograssWind;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomPrograss(
            weatherPropertyName: AppStrings.temp,
            prograss: prograssTemp,
            maxPrograss: 56.7, // Max Temp
            startValueNotifier: ValueNotifier(-89.2), // Min Temp
          ),
        ),
        Expanded(
          child: CustomPrograss(
            weatherPropertyName: AppStrings.humeditiy,
            prograss: prograssHumaditiy,
            maxPrograss: 100, // Max Humadidty
            startValueNotifier: ValueNotifier(0), // Min Humadidty
          ),
        ),
        Expanded(
          child: CustomPrograss(
            weatherPropertyName: AppStrings.wind,
            prograss: prograssWind,
            maxPrograss: 250, // Max Wind
            startValueNotifier: ValueNotifier(0), // Min Wind
          ),
        ),
      ],
    );
  }
}
