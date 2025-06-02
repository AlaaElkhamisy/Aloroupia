import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.onFieldSubmitted,
    required this.hintText,
    this.suffixIcon,
    this.icon,
  });
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String hintText;
  final Widget? suffixIcon;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required";
        } else {
          return null;
        }
      },
      onFieldSubmitted: onFieldSubmitted,
      style: AppTextStyles.headLinesStyle(context).copyWith(
        fontWeight: FontWeight.normal,
        fontSize: SizeConfig.width(context, 0.0465),
      ),
      cursorColor: AppColors.appYellowC,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: SizeConfig.width(context, 0.0232)),
          child: Icon(
            size: SizeConfig.width(context, 0.0581), //25,
            icon,
            color: AppColors.appYellowC,
          ),
        ),
        enabledBorder: _buildBorder(context),
        focusedBorder: _buildBorder(context),
        hintText: hintText,
        hintStyle: AppTextStyles.normalTextStyle(
          context,
        ).copyWith(color: Colors.grey.shade400),
      ),
    );
  }

  OutlineInputBorder _buildBorder(context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.0232)),
      borderSide: BorderSide(
        color: AppColors.appYellowC,
        width: SizeConfig.width(context, 0.0069),
      ),
    );
  }
}
