import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    this.icon,
    required this.text,
    this.onTap,
    this.image,
  });

  final IconData? icon;
  final String text;
  final void Function()? onTap;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          image != null
              ? Image.asset(image!, width: 30, height: 30)
              : Icon(icon, color: AppColors.appYellowC, size: 30),
      title: Text(
        text,
        style: AppTextStyles.headLinesStyle(context).copyWith(fontSize: 18),
      ),
      onTap: onTap,
    );
  }
}
