import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/customs/custom_btn.dart';
import 'package:aloroupia/core/manager/customs/custom_text_field.dart';
import 'package:aloroupia/core/manager/navigation/navigation.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/core/router/app_router.dart';
import 'package:aloroupia/features/auth/presentation/view_models/authCubit/auth_cubit.dart';
import 'package:aloroupia/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:aloroupia/features/chat/presentation/views_models/chat_cubit/chat_cubit.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginKey = GlobalKey();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: loginKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width(context, 0.0465),
            ),
            child: Column(
              spacing: SizeConfig.height(context, 0.0161), //15
              children: [
                SizedBox(height: SizeConfig.height(context, 0.0268)), //25
                Text(
                  S.of(context).logInToYourAccount,
                  style: AppTextStyles.headLinesStyle(context),
                ),
                SizedBox(height: SizeConfig.height(context, 0.0268)), //25
                CustomTextField(
                  hintText: S.of(context).email,
                  icon: CupertinoIcons.mail,
                  onChanged: (email) {
                    authCubit.userModel.email = email;
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
                  hintText: S.of(context).password,
                  icon: CupertinoIcons.padlock,
                  onChanged: (password) {
                    authCubit.userModel.password = password;
                  },
                  // suffixIcon: IconButton(
                  //   icon:
                  //       authCubit.obscurePasswordTextValue == true
                  //           ? const Icon(Icons.visibility_off)
                  //           : const Icon(Icons.visibility),
                  //   onPressed: () {
                  //     authCubit.obscurePasswordText();
                  //   },
                  // ),
                ),
                InkWell(
                  onTap: () {
                    context.pushNamed(AppRouter.forgotPasswordView);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      S.of(context).forgoyYourPassword,
                      style: AppTextStyles.headLinesStyle(context).copyWith(
                        color: Colors.grey,
                        fontSize: SizeConfig.width(context, 0.0348),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.height(context, 0.0858)),
                state is SignUpLoadingState
                    ? CircularProgressIndicator(color: AppColors.appYellowC)
                    : CustomBtn(
                      text: S.of(context).logIn,
                      color: Colors.black,
                      onPressed: () {
                        if (loginKey.currentState!.validate()) {
                          // setState(() {
                          //   BlocProvider.of<ChatCubit>(context).getMessages();
                          // });

                          authCubit.signInWithEmailAndPassword();
                          context.pushReplacementNamed(AppRouter.navBarView);
                        }
                      },
                    ),
                HaveAnAccountWidget(
                  text1: S.of(context).dontHaveAccount,
                  text2: S.of(context).signUp,
                  onTap: () {
                    context.pushReplacementNamed(AppRouter.signUPView);
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
