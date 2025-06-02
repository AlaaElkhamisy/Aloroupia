import 'package:aloroupia/core/manager/images/app_images.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';

class OnboardingModel {
  final String imagePath;
  final String title;

  OnboardingModel({required this.imagePath, required this.title});
}

List<OnboardingModel> getOnboardingData(BuildContext context) {
  return [
    OnboardingModel(
      imagePath: AppImages.couchImage,
      title: S.of(context).welcomeToTheBestQuality,
    ),
    OnboardingModel(
      imagePath: AppImages.chairImage,
      title: S.of(context).chooseWhatsGood,
    ),
    OnboardingModel(
      imagePath: AppImages.bedImage,
      title: S.of(context).letStartAndPickUp,
    ),
  ];
}
