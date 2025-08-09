import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/functions/custom_toast.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      showToast("Can't launch $url", AppColors.appYellowC);
    }
  }
}

Future<void> launchWhatsAppChat(String phoneNumber) async {
  // Format phone number (remove spaces, special characters)
  final formattedNumber = phoneNumber.replaceAll(RegExp(r'[^0-9+]'), '');

  // WhatsApp URL scheme (use 'wa.me' for universal links)
  final url = Uri.parse('https://wa.me/$formattedNumber');

  // Alternative (if 'wa.me' doesn't work)
  // final url = Uri.parse('https://api.whatsapp.com/send?phone=$formattedNumber');

  if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication, // Opens WhatsApp directly
    );
  } else {
    throw 'Could not launch WhatsApp';
  }
}
