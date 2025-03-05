import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/core/constants/app_text_styles.dart';
import 'package:cellula_project/core/helper/extensions.dart';
import 'package:cellula_project/features/home/presenation/ui/widgets/weather_info_prograss_bars.dart';
import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
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
    return Center(
      child: Column(
        children: [
          SizedBox(height: context.screenHight() * 0.08),
          Text(
            AppStrings.weatherInfo,
            style: AppTextStyles.font20WhiteBold,
          ),
          SizedBox(height: context.screenHight() * 0.08),
          WeatherInfoPrograssBars(
            prograssTemp: prograssTemp,
            prograssHumaditiy: prograssHumaditiy,
            prograssWind: prograssWind,
          ),
        
        ],
      ),
    );
  }
}
