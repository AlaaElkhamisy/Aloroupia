import 'package:aloroupia/features/home/presentation/views/widgets/category_app_bar.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/modern_grid_view.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';

class ModernView extends StatelessWidget {
  const ModernView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(category: S.of(context).modern),
      body: ModernGridView(),
    );
  }
}
