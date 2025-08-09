import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/custom_elvated_icon_btn.dart';
import 'package:aloroupia/features/ai_generate/presentation/views_model/cubit/ai_generator_cubit.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key, required this.cubit});

  final AiChatCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomElevatedIconButton(
            label: 'Regenerate',
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () => cubit.generateImage(),
          ),
          CustomElevatedIconButton(
            label: 'Share',
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () => cubit.shareImage(),
            bgColor: AppColors.appCamelC,
          ),
        ],
      ),
    );
  }
}
