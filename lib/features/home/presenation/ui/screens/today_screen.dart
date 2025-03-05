import 'package:cellula_project/core/constants/app_text_styles.dart';
import 'package:cellula_project/core/helper/extensions.dart';
import 'package:cellula_project/features/home/presenation/logic/weather_cubit.dart';
import 'package:cellula_project/features/home/presenation/logic/weather_states.dart';
import 'package:cellula_project/features/home/presenation/ui/widgets/custom_expecation_button.dart';
import 'package:cellula_project/features/home/presenation/ui/widgets/weather_info_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<WeatherCubit, WeatherStates>(
            builder: (context, state) {
              if (state is SuccessWeatherState) {
                return WeatherInfoBody(
                  prograssTemp: state.weatherData[0].avgTempC,
                  prograssHumaditiy: state.weatherData[0].avgHumidity,
                  prograssWind: state.weatherData[0].maxWindKph,
                );
              } else if (state is LoadingWeatherState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else {
                return Center(
                  child: Text("Faild", style: AppTextStyles.font20WhiteBold),
                );
              }
            },
          ),
          SizedBox(height: context.screenHight() * 0.1),
          CustomExpectationButton(day: 0),
        ],
      ),
    );
  }
}
