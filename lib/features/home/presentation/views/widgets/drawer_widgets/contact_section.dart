import 'package:aloroupia/core/manager/functions/launch_url.dart';
import 'package:aloroupia/core/manager/images/app_icons.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/features/home/data/media_links.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/drawer_widgets/contact_item.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).contact,
          style: AppTextStyles.headLinesStyle(context),
        ),
        Divider(color: Colors.grey, thickness: 1, indent: 20, endIndent: 20),
        ContactItem(
          image: AppIcons.tiktokIcon,
          text: S.of(context).tiktok,
          onTap: () {
            launchCustomUrl(context, tiktokLink);
          },
        ),
        ContactItem(
          image: AppIcons.instgramIcon,
          text: S.of(context).instgram,
          onTap: () => launchCustomUrl(context, instgramLink),
        ),
        ContactItem(
          image: AppIcons.whatsappIcon,
          text: S.of(context).whatsapp,
          onTap: () => launchWhatsAppChat(whatsappLink),
        ),
      ],
    );
  }
}
