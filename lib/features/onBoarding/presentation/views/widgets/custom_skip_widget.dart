import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomSkipWidget extends StatelessWidget {
  const CustomSkipWidget({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          S.of(context).skip,
          style: AppTextStyles.headLinesStyle(
            context,
          ).copyWith(fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
