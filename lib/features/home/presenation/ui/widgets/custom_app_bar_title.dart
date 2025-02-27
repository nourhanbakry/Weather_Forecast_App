import 'package:cellula_project/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({
    super.key,
    required this.name,
  });

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Hello \n",
                  style: AppTextStyles.font30WhiteBold,
                ),
                TextSpan(
                    text: "$name", style: AppTextStyles.font26lightBlueRegular),
              ],
            ),
          ),
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 50,
          ),
        ],
      ),
    );
  }
}
