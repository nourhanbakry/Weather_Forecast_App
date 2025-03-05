import 'package:cellula_project/core/constants/app_colors.dart';
import 'package:cellula_project/core/constants/app_text_styles.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';

class CustomPrograss extends StatelessWidget {
  const CustomPrograss({
    super.key,
    required this.weatherPropertyName,
    required this.prograss,
    required this.maxPrograss,
    required this.startValueNotifier,
  });
  final ValueNotifier<double> startValueNotifier;
  final String weatherPropertyName;
  final double prograss;
  final double maxPrograss;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashedCircularProgressBar.aspectRatio(
          aspectRatio: 1.5, // width ÷ height
          valueNotifier: startValueNotifier,
          progress: prograss,
          maxProgress: maxPrograss,
          corners: StrokeCap.butt,
          foregroundColor: AppColors.lightBlue,
          backgroundColor: const Color(0xffeeeeee),
          foregroundStrokeWidth: 7,
          backgroundStrokeWidth: 7,
          animation: true,
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: startValueNotifier,
              builder: (_, double value, __) => Text(
                '${value.toInt()}',
                style: AppTextStyles.font16WhiteRegular,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          weatherPropertyName,
          style: AppTextStyles.font16WhiteRegular,
        ),
      ],
    );
  }
}
