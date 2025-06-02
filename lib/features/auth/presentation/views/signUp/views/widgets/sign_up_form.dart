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

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signUpKey = GlobalKey();
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
            ),
            CustomTextField(
              hintText: S.of(context).email,
              icon: CupertinoIcons.mail,
            ),
            CustomTextField(
              hintText: S.of(context).dateOfBirth,
              icon: CupertinoIcons.calendar_today,
            ),
            CustomTextField(
              hintText: S.of(context).password,
              icon: CupertinoIcons.padlock,
            ),
            CustomTextField(
              hintText: S.of(context).confirmPassword,
              icon: CupertinoIcons.padlock,
            ),
            SizedBox(height: SizeConfig.height(context, 0.0322)), //30
            CustomBtn(
              text: S.of(context).signUp,
              color: Colors.black,
              onPressed: () {
                if (signUpKey.currentState!.validate()) {
                  context.pushReplacementNamed(AppRouter.logInView);
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
  }
}
