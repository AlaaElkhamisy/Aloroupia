import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/history_list_view.dart';
import 'package:aloroupia/features/ai_generate/presentation/views_model/cubit/fetch_all_generated_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryDrawerBody extends StatefulWidget {
  const HistoryDrawerBody({super.key});

  @override
  State<HistoryDrawerBody> createState() => _HistoryDrawerBodyState();
}

class _HistoryDrawerBodyState extends State<HistoryDrawerBody> {
  void initState() {
    super.initState();
    BlocProvider.of<FetchAllGeneratedImagesCubit>(
      context,
      listen: false,
    ).fetchAllGeneratedImages();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          spacing: 20,
          children: [
            //SizedBox(height: 20),
            Text('History', style: AppTextStyles.headLinesStyle(context)),
            Expanded(child: HistoryListView()),
          ],
        ),
      ),
    );
  }
}
