import 'package:aloroupia/core/manager/customs/custom_btn.dart';
import 'package:aloroupia/core/manager/images/app_images.dart';
import 'package:aloroupia/core/manager/navigation/navigation.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/core/router/app_router.dart';
import 'package:aloroupia/features/auth/presentation/views/forgot_password/views/widgets/otp_form_item.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';

class VerifyAccountBody extends StatelessWidget {
  const VerifyAccountBody({super.key});

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
            S.of(context).enterPinCode,
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
          Text(
            S.of(context).enterTheFour4Sent,
            style: AppTextStyles.normalTextStyle(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpFormItem(onSaved: (pin1) {}),
              OtpFormItem(onSaved: (pin2) {}),
              OtpFormItem(onSaved: (pin3) {}),
              OtpFormItem(onSaved: (pin4) {}),
            ],
          ),
          SizedBox(
            height: SizeConfig.height(context, 0.0536), //50
          ),
          CustomBtn(
            text: S.of(context).confirm,
            onPressed: () {
              context.pushReplacementNamed(AppRouter.createNewPasswordView);
            },
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
