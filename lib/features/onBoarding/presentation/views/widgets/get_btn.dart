import 'package:aloroupia/core/manager/customs/custom_btn.dart';
import 'package:aloroupia/core/manager/navigation/navigation.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/core/router/app_router.dart';
import 'package:aloroupia/features/onBoarding/data/onboarding_model.dart';
import 'package:aloroupia/features/onBoarding/functions/onboarding_visited.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';

class GetBtn extends StatelessWidget {
  const GetBtn({
    super.key,
    required this.currentIndex,
    required this.controller,
  });
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == getOnboardingData(context).length - 1) {
      return Column(
        children: [
          CustomBtn(
            text: S.of(context).createAccount,
            onPressed: () {
              onBoardingVisited();
              context.pushReplacementNamed(AppRouter.signUPView);
            },
            color: Colors.black,
          ),
          SizedBox(height: SizeConfig.height(context, 0.0161)),
          GestureDetector(
            onTap: () {
              onBoardingVisited();
              context.pushReplacementNamed(AppRouter.logInView);
            },
            child: Text(
              S.of(context).logInNow,
              style: AppTextStyles.headLinesStyle(context).copyWith(
                fontWeight: FontWeight.normal,
                fontSize: SizeConfig.width(context, 0.0348),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      );
    }
    return CustomBtn(
      text: S.of(context).next,
      textColor: Colors.grey.shade100,
      onPressed: () {
        controller.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.bounceIn,
        );
      },
    );
  }
}
