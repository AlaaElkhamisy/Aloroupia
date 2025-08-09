import 'package:aloroupia/features/ai_generate/presentation/views/widgets/custom_ai_appBar.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/generated_image_container.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/history_drawer_body.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/prompt_container.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/top_side_widget.dart';
import 'package:aloroupia/features/ai_generate/presentation/views_model/cubit/ai_generator_cubit.dart';
import 'package:aloroupia/features/ai_generate/presentation/views_model/cubit/fetch_all_generated_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiChatView extends StatelessWidget {
  const AiChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AiChatCubit()..requestPermissions(),
      child: Scaffold(
        appBar: CustomAIAppBar(),
        drawer: BlocProvider(
          create:
              (context) =>
                  FetchAllGeneratedImagesCubit()..fetchAllGeneratedImages(),
          child: HistoryDrawerBody(),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    AIGenerateorTopUI(),
                    PromptContainerWidget(),
                    GeneratedImageContainerWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
