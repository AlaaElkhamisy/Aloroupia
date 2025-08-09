import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProfilePictureOptionItem extends StatelessWidget {
  const ProfilePictureOptionItem({
    super.key,
    required this.icon,
    this.onPressed,
    required this.lable,
  });
  final IconData icon;
  final void Function()? onPressed;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.appYellowC, width: 1.5),
          ),
          child: IconButton(
            onPressed: onPressed,
            padding: const EdgeInsets.all(0),
            icon: Icon(icon, color: Colors.grey, size: 30),
          ),
        ),
        Text(
          lable,
          style: AppTextStyles.normalTextStyle(
            context,
          ).copyWith(fontSize: 12, color: AppColors.appYellowC),
        ),
      ],
    );
  }
}
