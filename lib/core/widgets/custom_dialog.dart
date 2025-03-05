import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/core/constants/app_text_styles.dart';
import 'package:cellula_project/core/helper/extensions.dart';
import 'package:flutter/material.dart';

customDialog(context,String title) {

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(title),
        contentTextStyle: AppTextStyles.font14LightBlueRegular,
        titleTextStyle: AppTextStyles.font30LightBlueBold,
        title: Text(AppStrings.expectation),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "Ok",
              style: AppTextStyles.font26lightBlueRegular,
            ),
          ),
        ],
      );
    },
  );
}
