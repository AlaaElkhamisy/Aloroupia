import 'package:aloroupia/features/home/presentation/views/widgets/category_app_bar.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/classic_grid_view.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';

class ClassicView extends StatelessWidget {
  const ClassicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(category: S.of(context).classic),
      body: ClassicGridView(),
    );
  }
}
