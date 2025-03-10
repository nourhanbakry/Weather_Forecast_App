import 'package:cellula_project/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
 final bool obscureText ;

   const CustomTextField(
      {super.key, required this.label, required this.controller,this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.font20WhiteBold),
        const SizedBox(height: 5),
        TextField(
          obscureText:obscureText ,
          style: AppTextStyles.font16WhiteRegular,
          controller: controller,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white24,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
