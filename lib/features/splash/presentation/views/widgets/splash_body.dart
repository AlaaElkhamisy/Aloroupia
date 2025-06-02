import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/images/app_images.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: SizeConfig.height(context, 0.0322)),
          Image.asset(AppImages.tShadowLogo),
          Text(
            S.of(context).aloroupia,
            style: AppTextStyles.appNameStyle(context),
          ),
          SizedBox(height: SizeConfig.height(context, 0.0322)),
          SizedBox(
            width: SizeConfig.width(context, 0.0697),
            child: LoadingIndicator(
              colors: [AppColors.appCamelC],
              indicatorType: Indicator.ballPulse,
            ),
          ),
        ],
      ),
    );
  }
}
