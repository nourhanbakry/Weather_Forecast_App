import 'package:cellula_project/core/constants/app_colors.dart';
import 'package:cellula_project/core/constants/app_strings.dart';
import 'package:cellula_project/core/constants/app_text_styles.dart';
import 'package:cellula_project/core/helper/extensions.dart';
import 'package:cellula_project/core/widgets/custom_text_button.dart';
import 'package:cellula_project/features/login/presentation/Logic/login_cubit.dart';
import 'package:cellula_project/features/login/presentation/Logic/login_states.dart';
import 'package:cellula_project/features/login/presentation/UI/widgets/dont_have_account.dart';
import 'package:cellula_project/features/login/presentation/UI/widgets/login_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({
    super.key,
  });

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('success')));
        } else if (state is FailureLoginState) {
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
                LoginFields(
                    emailController: emailController,
                    passwordController: passwordController),
                CustomTextButton(
                  onPressed: () {
                    BlocProvider.of<LoginCubit>(context).login(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  backGroundColor: AppColors.lightBlue,
                  foregroundColor: Colors.white,
                  child: state is LoadingLoginState
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(AppStrings.logIn,
                          style: AppTextStyles.font26ExtraBold),
                ),
                DontHaveAccount(),
                SizedBox(height: context.screenHight() * 0.15),
              ],
            ),
          ),
        );
      },
    );
  }
}
