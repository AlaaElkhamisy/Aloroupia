import 'package:aloroupia/core/manager/functions/launch_url.dart';
import 'package:aloroupia/core/manager/images/app_icons.dart';
import 'package:aloroupia/core/manager/images/app_images.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Image.asset(
                AppIcons.menuIcon,
                matchTextDirection: true,
                width: SizeConfig.width(context, 0.1047), //45
              ),
            ),
            Image.asset(
              AppImages.tLogo,
              width: SizeConfig.width(context, 0.3488), //150
              //height: SizeConfig.height(context, 0.0523), //23
            ),
            IconButton(
              onPressed: () {
                launchCustomUrl(
                  context,
                  'https://maps.app.goo.gl/Um6io8XguZKimACt7',
                );
              },
              icon: Icon(
                Icons.location_on_outlined,
                size: SizeConfig.width(context, 0.0587), //30
                color: Colors.black,
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
