import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/functions/custom_toast.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/bottom_btn.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/generated_image.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/prompt.dart';
import 'package:aloroupia/features/ai_generate/presentation/views_model/cubit/ai_generator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneratedImageContainerWidget extends StatelessWidget {
  const GeneratedImageContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AiChatCubit, AiChatState>(
      listener: (context, state) {
        if (state is AiChatError) {
          showToast(state.message, Colors.red);
        } else if (state is AiChatGenerated) {
          showToast("Image generated successfully!", AppColors.appCamelC);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AiChatCubit>();
        if (state is AiChatGenerated) {
          return Card(
            elevation: 0,
            color: AppColors.appYellowC.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.image_outlined,
                        color: Colors.black,
                        size: 24,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Generated Image',
                        style: AppTextStyles.headLinesStyle(context).copyWith(
                          color: AppColors.appYellowC,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GeneratedImage(image: state.image),
                  const SizedBox(height: 16),
                  Prompt(prompt: state.prompt),
                  const SizedBox(height: 16),
                  BottomButtons(cubit: cubit),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
