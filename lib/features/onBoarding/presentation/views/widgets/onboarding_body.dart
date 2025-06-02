import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/features/onBoarding/data/onboarding_model.dart';
import 'package:aloroupia/features/onBoarding/presentation/views/widgets/custom_smooth_dots_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.controller,
    this.onPageChanged,
  });

  final PageController? controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      controller: controller,
      itemCount: getOnboardingData(context).length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              getOnboardingData(context)[index].imagePath,
              width: SizeConfig.width(context, 0.9067),
              height: SizeConfig.height(context, 0.2146),
            ),
            Text(
              textAlign: TextAlign.center,
              getOnboardingData(context)[index].title,
              style: AppTextStyles.headLinesStyle(context),
            ),
            SizedBox(height: SizeConfig.height(context, 0.0161)),
            CustomSmoothDotsIndicator(controller: controller!),
          ],
        );
      },
    );
  }
}
