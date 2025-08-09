import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/features/ai_generate/data/ai_messaging_model.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/custom_elevated_btn.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/loading_widget.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/normal_btn_lable.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/prompt_text_field.dart';
import 'package:aloroupia/features/ai_generate/presentation/views_model/cubit/ai_generator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromptContainerWidget extends StatelessWidget {
  const PromptContainerWidget({super.key, this.generatedModel});
  final AiMessagingModel? generatedModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiChatCubit, AiChatState>(
      builder: (context, state) {
        final cubit = context.read<AiChatCubit>();
        return Card(
          color: AppColors.appYellowC.withOpacity(0.1),
          elevation: 0,
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
                    const Icon(Icons.edit_outlined, color: Colors.black),
                    const SizedBox(width: 8),
                    Text(
                      "Describe your vision",
                      style: AppTextStyles.headLinesStyle(context).copyWith(
                        color: AppColors.appYellowC,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                PromptTextField(controller: cubit.promptController),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: CustomElvatedButton(
                    onPressed:
                        state is AiChatLoading
                            ? null
                            : () => cubit.generateImage(),
                    child:
                        state is AiChatLoading
                            ? LoadingWidget()
                            : NormalButtonLable(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
