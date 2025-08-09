import 'package:aloroupia/constants.dart';
import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/features/ai_generate/data/ai_messaging_model.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/clear_history_button.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/history_item.dart';
import 'package:aloroupia/features/ai_generate/presentation/views_model/cubit/ai_generator_cubit.dart';
import 'package:aloroupia/features/ai_generate/presentation/views_model/cubit/fetch_all_generated_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class HistoryListView extends StatefulWidget {
  const HistoryListView({super.key});

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      FetchAllGeneratedImagesCubit,
      FetchAllGeneratedImagesState
    >(
      builder: (context, state) {
        List<AiMessagingModel> generatedImages =
            BlocProvider.of<FetchAllGeneratedImagesCubit>(
              context,
            ).generatedImages!;
        if (state is FetchAllGeneratedImagesSuccess) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Expanded(
                //height: 300,
                child: ListView.separated(
                  itemCount: generatedImages.length,
                  separatorBuilder:
                      (context, index) => Divider(
                        color: Colors.grey.shade300,
                        endIndent: 30,
                        indent: 30,
                      ),
                  itemBuilder: (context, index) {
                    Color containerColor =
                        (index % 2 == 0)
                            ? AppColors.appYellowC.withOpacity(0.04)
                            : Colors.grey.withOpacity(0.06);
                    return HistoryItem(
                      prompt: generatedImages[index].prompt,
                      containerColor: containerColor,
                      onItemTap: () {
                        Navigator.of(context).pop();
                        BlocProvider.of<AiChatCubit>(
                          context,
                        ).setFromHistory(generatedImages[index]);
                      },
                      onDelete: () {
                        setState(() {
                          generatedImages[index].delete();
                          BlocProvider.of<FetchAllGeneratedImagesCubit>(
                            context,
                          ).fetchAllGeneratedImages();
                        });
                      },
                    );
                  },
                ),
              ),
              if (generatedImages.isNotEmpty)
                ClearHistoryIconBtn(
                  onPressed: () async {
                    Navigator.of(context).pop(); // Close dialog first
                    setState(() {
                      generatedImages.clear(); // Then clear images
                    });
                    final box = await Hive.openBox<AiMessagingModel>(
                      kAiChatHistoryBox,
                    );
                    await box.clear();
                    BlocProvider.of<FetchAllGeneratedImagesCubit>(
                      context,
                    ).fetchAllGeneratedImages(); // Then fetch new images
                  },
                ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
