import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1;
  final String text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: AppTextStyles.headLinesStyle(context).copyWith(
              fontWeight: FontWeight.normal,
              fontSize: SizeConfig.width(context, 0.0348), //15
              color: Colors.grey,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: text2,
            style: AppTextStyles.headLinesStyle(context).copyWith(
              fontSize: SizeConfig.width(context, 0.0348), //15
              color: AppColors.appYellowC,
            ),
          ),
        ],
      ),
    );
  }
}
