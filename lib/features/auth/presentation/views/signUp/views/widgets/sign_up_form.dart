import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/customs/custom_btn.dart';
import 'package:aloroupia/core/manager/customs/custom_text_field.dart';
import 'package:aloroupia/core/manager/functions/custom_toast.dart';
import 'package:aloroupia/core/manager/navigation/navigation.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/core/router/app_router.dart';
import 'package:aloroupia/features/auth/presentation/view_models/authCubit/auth_cubit.dart';
import 'package:aloroupia/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signUpKey = GlobalKey();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showToast(
            "Successfully, Check your email to verify your account",
            AppColors.appYellowC,
          );
          context.pushReplacementNamed(AppRouter.logInView);
        } else if (state is SignUpFailuerState) {
          showToast(state.errMessage, Colors.red);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: signUpKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width(context, 0.0465),
            ),
            child: Column(
              spacing: SizeConfig.height(context, 0.0161), //15
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.height(context, 0.0643)), //60
                Text(
                  S.of(context).createNewAccount,
                  style: AppTextStyles.headLinesStyle(context),
                ),

                SizedBox(height: SizeConfig.height(context, 0.0322)), //30
                CustomTextField(
                  hintText: S.of(context).name,
                  icon: CupertinoIcons.person,
                  onChanged: (name) {
                    authCubit.userModel.name = name;
                  },
                ),
                CustomTextField(
                  hintText: S.of(context).email,
                  icon: CupertinoIcons.mail,
                  onChanged: (email) {
                    authCubit.userModel.email = email;
                  },
                ),
                CustomTextField(
                  hintText: S.of(context).dateOfBirth,
                  icon: CupertinoIcons.calendar_today,
                  onFieldSubmitted: (date) {
                    authCubit.userModel.birthDate = date;
                  },
                ),
                CustomTextField(
                  obscureText: authCubit.obscurePasswordTextValue!,
                  suffixIcon: IconButton(
                    icon:
                        authCubit.obscurePasswordTextValue == true
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                    onPressed: () {
                      authCubit.obscurePasswordText();
                    },
                  ),
                  hintText: S.of(context).password,
                  icon: CupertinoIcons.padlock,
                  onChanged: (password) {
                    authCubit.userModel.password = password;
                  },
                ),
                CustomTextField(
                  suffixIcon: IconButton(
                    icon:
                        authCubit.obscurePasswordTextValue == true
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                    onPressed: () {
                      authCubit.obscurePasswordText();
                    },
                  ),
                  obscureText: authCubit.obscurePasswordTextValue!,
                  hintText: S.of(context).confirmPassword,
                  icon: CupertinoIcons.padlock,
                  onChanged: (confirmPassword) {
                    // Here you can add logic to check if confirmPassword matches password
                  },
                ),
                SizedBox(height: SizeConfig.height(context, 0.0322)), //30
                state is SignUpLoadingState
                    ? CircularProgressIndicator(color: AppColors.appYellowC)
                    : CustomBtn(
                      text: S.of(context).signUp,
                      color: Colors.black,
                      onPressed: () async {
                        if (signUpKey.currentState!.validate()) {
                          //await context.pushReplacementNamed(AppRouter.logInView);
                          await authCubit.signUpWithEmailAndPassword();
                        }
                      },
                    ),
                HaveAnAccountWidget(
                  text1: S.of(context).alreadyHaveAnAccount,
                  text2: S.of(context).logIn,
                  onTap: () {
                    context.pushReplacementNamed(AppRouter.logInView);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
