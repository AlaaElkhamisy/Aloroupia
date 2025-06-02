import 'package:aloroupia/core/manager/customs/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryAppBar({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(viewTitle: category);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
