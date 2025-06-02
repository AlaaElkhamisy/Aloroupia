import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.color,
    required this.text,
    this.onPressed,
    this.textColor,
  });
  final Color? color;
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height(context, 0.0601),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.width(context, 0.0232),
            ),
          ),
          backgroundColor: color ?? Colors.white.withOpacity(0.55),
        ),
        child: Text(
          text,
          style: AppTextStyles.headLinesStyle(
            context,
          ).copyWith(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
