import 'package:aloroupia/features/home/presentation/views/widgets/category_app_bar.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/new_classic_grid_view.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';

class NewClassicView extends StatelessWidget {
  const NewClassicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(category: S.of(context).newClassic),
      body: NewClassicGridView(),
    );
  }
}
