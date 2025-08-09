import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/images/app_icons.dart';
import 'package:flutter/material.dart';

class CustomAIAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAIAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.appCamelC,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Image.asset(
                  AppIcons.historyIcon,
                  matchTextDirection: true,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
