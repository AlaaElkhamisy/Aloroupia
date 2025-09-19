import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/features/notifications/presentation/views/widgets/orders_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrdersAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 15);
          },
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(16),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  color: AppColors.appYellowC.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    'No new notifications No new notificationsNo new notificationsNo new notificationsNo new notificationsNo new notifications',
                    style: TextStyle(
                      //color: A,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
