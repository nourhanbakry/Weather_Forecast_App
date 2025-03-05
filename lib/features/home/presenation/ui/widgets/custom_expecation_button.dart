import 'package:cellula_project/core/constants/app_colors.dart';
import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/core/widgets/custom_dialog.dart';
import 'package:cellula_project/core/widgets/custom_text_button.dart';
import 'package:cellula_project/features/home/presenation/logic/prediction_cubit.dart';
import 'package:cellula_project/features/home/presenation/logic/prediction_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomExpectationButton extends StatelessWidget {
  const CustomExpectationButton({
    super.key,
    required this.day,
  });
  final int day;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PredictionCubit, WeatherPredctitionStates>(
        listener: (context, state) {
          if (state is SuccessWeatherPredictionState) {
            customDialog(context,state.predcition == 1
                      ? 'You can go outside'
                      : 'Stay at home' );
          } else if (state is FailureWeatherPredicitionState) {
            customDialog(context,"Faild to get Prediction");
          } else{
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Loading.......')),
            );
          }

        },
        child: CustomTextButton(
          onPressed: () {
            context.read<PredictionCubit>().getPrediction(day);
            print("workinnggggggggggggggggggggggg");
            print("doneeeeeeeeeeeeeeeee");
          },
          backGroundColor: Colors.white,
          foregroundColor: AppColors.lightBlue,
          child: Text(AppStrings.expectation),
        ));
  }
}
