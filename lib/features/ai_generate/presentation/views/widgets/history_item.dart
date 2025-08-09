import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.prompt,
    required this.containerColor,
    this.onItemTap,
    this.onDelete,
  });
  final String prompt;
  final Color containerColor;
  final void Function()? onItemTap;
  //final void Function()? onItemLongPress;
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      onLongPress: () {
        showMenu<int>(
          context: context,
          position: RelativeRect.fromLTRB(
            100,
            100,
            100,
            0,
          ), // Adjust position as needed
          items: [
            PopupMenuItem(
              value: 1,
              child: const Text("Delete", textAlign: TextAlign.center),
              onTap: onDelete,
            ),
          ],
        );
      },
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          prompt,
          style: AppTextStyles.normalTextStyle(
            context,
          ).copyWith(color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
