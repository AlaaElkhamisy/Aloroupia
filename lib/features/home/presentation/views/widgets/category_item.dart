import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryName,
    this.onTap,
    this.color,
  });
  final String categoryName;
  final VoidCallback? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.width(context, 0.2325), //100
        height: SizeConfig.height(context, 0.0482), //45
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width(context, 0.01161),
        ), //5
        decoration: BoxDecoration(
          //color: Colors.grey.withOpacity(0.2),
          border: Border.all(
            color: Colors.grey,
            width: SizeConfig.width(context, 0.0046),
          ), //2
          borderRadius: BorderRadius.circular(
            SizeConfig.width(context, 0.0232), //10
          ),
        ),
        child: Center(
          child: AutoSizeText(
            textAlign: TextAlign.center,
            categoryName,
            style: AppTextStyles.normalTextStyle(context),
          ),
        ),
      ),
    );
  }
}
