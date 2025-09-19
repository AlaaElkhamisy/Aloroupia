import 'dart:typed_data';

import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/custom_elvated_icon_btn.dart';
import 'package:aloroupia/features/ai_generate/presentation/views_model/cubit/ai_generator_cubit.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
    required this.cubit,
    required this.generatedImage,
    required this.path,
  });

  final AiChatCubit cubit;
  final Uint8List generatedImage;
  final String path;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomElevatedIconButton(
            label: 'Regenerate',
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () => cubit.generateImage(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedIconButton(
                label: 'Share',
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () => cubit.shareImage(),
                bgColor: AppColors.appCamelC,
              ),
              CustomElevatedIconButton(
                label: 'Save',

                icon: const Icon(Icons.save_alt_rounded, color: Colors.white),
                onPressed: () => cubit.saveImageToGallery(context),
                bgColor: AppColors.appbrownC,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
