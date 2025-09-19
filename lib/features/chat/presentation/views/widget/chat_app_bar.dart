import 'package:aloroupia/core/manager/images/app_images.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 15,
              children: [
                // IconButton(
                //   onPressed: () {
                //     context.pushNamed(AppRouter.ho);
                //   },
                //   icon: const Icon(
                //     Icons.arrow_back_ios_new_outlined,
                //     color: Colors.black,
                //   ),
                // ),
                CircleAvatar(
                  radius: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.log, // Replace with your logo path
                        ), // Replace with your logo path
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Text(
                  S.of(context).aloroupia,
                  style: AppTextStyles.headLinesStyle(
                    context,
                  ).copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                // Handle settings action
              },
              icon: const Icon(Icons.settings_outlined, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(98);
}
