import 'package:aloroupia/core/manager/images/app_icons.dart';
import 'package:aloroupia/core/manager/images/app_images.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Image.asset(AppIcons.menuIcon),
          ),
          Image.asset(AppImages.tLogo),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.location_on_outlined,
              size: SizeConfig.width(context, 0.0697), //30
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
