import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:flutter/material.dart';

class Prompt extends StatelessWidget {
  const Prompt({super.key, required this.prompt});
  final String prompt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.appYellowC.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        prompt,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
      ),
    );
  }
}
