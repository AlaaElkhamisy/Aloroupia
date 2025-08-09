import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AIGenerateorTopUI extends StatelessWidget {
  const AIGenerateorTopUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(Icons.auto_awesome, size: 48, color: AppColors.appYellowC),
          const SizedBox(height: 16),
          Text(
            'AI Image Generator',
            style: AppTextStyles.headLinesStyle(context).copyWith(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Transform your ideas into stunning images',
            style: AppTextStyles.normalTextStyle(
              context,
            ).copyWith(color: Colors.grey.shade600, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
