import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/images/app_images.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class TopSideContainerLogIn extends StatelessWidget {
  const TopSideContainerLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.height(context, 0.322),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: SizeConfig.width(context, 0.0930)),
      decoration: BoxDecoration(color: AppColors.appYellowC),
      child: SafeArea(
        child: Stack(
          //alignment: Alignment.bottomCenter,

          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(AppImages.logIcon),
                  ),
                ),
              ),
            ),
            StrokeText(
              strokeWidth: SizeConfig.width(context, 0.0069),
              strokeColor: Colors.black,
              text: S.of(context).aloroupia,
              textStyle: AppTextStyles.headLinesStyle(context).copyWith(
                color: Colors.white,
                fontSize: SizeConfig.width(context, 0.0754),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
