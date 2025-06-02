import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothDotsIndicator extends StatelessWidget {
  const CustomSmoothDotsIndicator({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      effect: ExpandingDotsEffect(
        dotColor: Colors.white,
        activeDotColor: AppColors.appCamelC,
        dotHeight: SizeConfig.width(context, 0.0186),
        spacing: SizeConfig.width(context, 0.0069),
        radius: SizeConfig.width(context, 0.0465),
      ),
      controller: controller,
      count: 3,
    );
  }
}
