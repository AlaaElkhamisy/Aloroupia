import 'package:aloroupia/core/manager/customs/custom_btn.dart';
import 'package:aloroupia/core/manager/customs/custom_text_field.dart';
import 'package:aloroupia/core/manager/images/app_images.dart';
import 'package:aloroupia/core/manager/navigation/navigation.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/core/router/app_router.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordBody extends StatelessWidget {
  const CreateNewPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(context, 0.0465),
      ), //20
      child: Column(
        spacing: SizeConfig.height(context, 0.0161), //15
        children: [
          Image.asset(AppImages.tLogo),
          SizedBox(height: SizeConfig.height(context, 0.0215)), //20
          Text(
            S.of(context).createNewPassword,
            style: AppTextStyles.headLinesStyle(context),
          ),
          Text(
            S.of(context).restYourPassword,
            style: AppTextStyles.normalTextStyle(
              context,
            ).copyWith(color: Colors.grey),
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),
          CustomTextField(
            hintText: S.of(context).enterNewPassword,
            icon: CupertinoIcons.lock,
          ),
          CustomTextField(
            hintText: S.of(context).confirmNewPassword,
            icon: CupertinoIcons.lock,
          ),
          SizedBox(
            height: SizeConfig.height(context, 0.0536), //50
          ),
          CustomBtn(
            color: Colors.black,
            text: S.of(context).logIn,
            onPressed: () {
              context.pushReplacementNamed(AppRouter.homeView);
            },
          ),
        ],
      ),
    );
  }
}
