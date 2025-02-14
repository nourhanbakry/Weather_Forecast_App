import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/core/constants/app_text_styles.dart';
import 'package:cellula_project/core/helper/extensions.dart';
import 'package:cellula_project/core/routing/routes.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.signup);
      },
      child: Text(
        AppStrings.dontHaveAnAccount,
        style: AppTextStyles.font14LightBlueRegular,
      ),
    );
  }
}