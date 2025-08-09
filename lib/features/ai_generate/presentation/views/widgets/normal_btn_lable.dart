import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class NormalButtonLable extends StatelessWidget {
  const NormalButtonLable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.auto_awesome, color: Colors.white),
        const SizedBox(width: 10),
        Text(
          'Generate Image',
          style: AppTextStyles.headLinesStyle(context).copyWith(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
