import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/core/constants/app_text_styles.dart';
import 'package:cellula_project/core/helper/extensions.dart';
import 'package:cellula_project/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key, required this.nameController, required this.emailController, required this.passwordController});
  final TextEditingController nameController;
   final TextEditingController emailController;
    final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.screenHight() * 0.1),
        Text(AppStrings.signupCapital, style: AppTextStyles.font60WhiteBold),
        Text(AppStrings.createAnAccountToMakeSDF,
            style: AppTextStyles.font16WhiteRegular),
        SizedBox(height: context.screenHight() * 0.08),
        CustomTextField(controller: nameController, label: AppStrings.fullName),
        SizedBox(height: 10),
        CustomTextField(controller: emailController, label: AppStrings.email),
        SizedBox(height: 10),
        CustomTextField(
            controller: passwordController, label: AppStrings.password,obscureText: true,),
        SizedBox(height: 40),
      ],
    );
  }
}
