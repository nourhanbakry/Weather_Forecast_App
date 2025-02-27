import 'package:cellula_project/core/constants/app_colors.dart';
import 'package:cellula_project/core/constants/app_font_weights.dart';
import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/core/helper/extensions.dart';
import 'package:cellula_project/core/routing/routes.dart';
import 'package:cellula_project/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class AuthSelectionButtons extends StatelessWidget {
  const AuthSelectionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextButton(
            onPressed: () {
              context.pushReplacementNamed(Routes.signup);
            },
            backGroundColor: AppColors.lightBlue,
            foregroundColor: Colors.white,
            child: Text(
        AppStrings.signUp,
        style: TextStyle(
          fontWeight: AppFontWeights.extraBold,
          fontSize: 26,
        ),
      ),),
        SizedBox(height: 16),
        CustomTextButton(
            onPressed: () {
              context.pushReplacementNamed(Routes.login);
            },
            backGroundColor: Colors.white,
            foregroundColor: AppColors.naivyBlue,
            child: Text(
        AppStrings.logIn,
        style: TextStyle(
          fontWeight: AppFontWeights.extraBold,
          fontSize: 26,
        ),
      ),),
      ],
    );
  }
}