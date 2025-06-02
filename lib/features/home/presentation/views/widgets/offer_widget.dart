import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width(context, 0.1046), //45
      height: SizeConfig.height(context, 0.0429), //40

      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.appCamelC,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(SizeConfig.width(context, 0.0465)), //20
          bottomLeft: Radius.circular(SizeConfig.width(context, 0.0465)), //20
        ),
      ),
      child: AutoSizeText(
        textAlign: TextAlign.center,
        S.of(context).offer,
        style: AppTextStyles.normalTextStyle(context).copyWith(
          fontFamily: "PlaypenSansArabic",
          fontSize: SizeConfig.width(context, 0.0279),
        ), //12
      ),
    );
  }
}
