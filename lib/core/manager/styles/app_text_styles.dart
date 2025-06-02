import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle appNameStyle(BuildContext context) {
    return TextStyle(
      fontFamily: "EncodeSansSC_Expanded",
      fontSize: SizeConfig.width(context, 0.0930), //40
      shadows: [
        BoxShadow(
          blurRadius: SizeConfig.width(context, 0.0071),
          spreadRadius: 0,
          offset: Offset(0, SizeConfig.height(context, 0.0049)),
          color: AppColors.appCamelC.withOpacity(0.70),
        ),
      ],
    );
  }

  static TextStyle headLinesStyle(BuildContext context) {
    return TextStyle(
      fontFamily: "inter",
      fontSize: SizeConfig.width(context, 0.0558), //24
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle normalTextStyle(BuildContext context) {
    return TextStyle(
      fontFamily: "inter",
      fontSize: SizeConfig.width(context, 0.0372), //16
    );
  }
}
