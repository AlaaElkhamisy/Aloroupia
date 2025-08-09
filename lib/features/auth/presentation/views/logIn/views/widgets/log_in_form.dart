import 'package:aloroupia/core/manager/customs/custom_btn.dart';
import 'package:aloroupia/core/manager/customs/custom_text_field.dart';
import 'package:aloroupia/core/manager/navigation/navigation.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/core/router/app_router.dart';
import 'package:aloroupia/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginKey = GlobalKey();
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
            ),
            CustomTextField(
              hintText: S.of(context).password,
              icon: CupertinoIcons.padlock,
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
            CustomBtn(
              text: S.of(context).logIn,
              color: Colors.black,
              onPressed: () {
                if (loginKey.currentState!.validate()) {
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
  }
}
