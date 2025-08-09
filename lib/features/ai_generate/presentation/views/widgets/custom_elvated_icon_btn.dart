import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedIconButton extends StatelessWidget {
  const CustomElevatedIconButton({
    super.key,
    this.bgColor,
    required this.label,
    this.onPressed,
    required this.icon,
  });
  final Color? bgColor;
  final String label;
  final void Function()? onPressed;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon, //const Icon(Icons.share, color: Colors.white),
      label: Text(
        label,
        style: AppTextStyles.headLinesStyle(context).copyWith(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        foregroundColor: Colors.grey[800],
        backgroundColor: bgColor ?? Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
