import 'package:cellula_project/core/constants/app_colors.dart';
import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/core/constants/app_text_styles.dart';
import 'package:cellula_project/core/helper/extensions.dart';
import 'package:cellula_project/core/widgets/custom_text_button.dart';
import 'package:cellula_project/features/sign_up/Presenation/Logic/sign_up_cubit.dart';
import 'package:cellula_project/features/sign_up/Presenation/Logic/sign_up_states.dart';
import 'package:cellula_project/features/sign_up/Presenation/UI/widgets/have_account.dart';
import 'package:cellula_project/features/sign_up/Presenation/UI/widgets/sign_up_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SucessSignUpState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('success')));
        } else if (state is FailureSignUpState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('faild')));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignUpFields(
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                CustomTextButton(
                  backGroundColor: AppColors.lightBlue,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    BlocProvider.of<SignUpCubit>(context).signUp(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  child: state is LoadingSignUpState
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(AppStrings.signupCapital,
                          style: AppTextStyles.font26ExtraBold),
                ),
                HaveAccount(),
                SizedBox(height: context.screenHight() * 0.1),
              ],
            ),
          ),
        );
      },
    );
  }
}
